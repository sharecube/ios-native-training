//
//  PhotoSelectionController.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 27.01.2024.
//  Copyright © 2024 Dmytro Geienko. All rights reserved.
//

import AVFoundation
import MobileCoreServices
import Photos
import PhotosUI
import UIKit

protocol PhotoSelectionControllerDelegate: AnyObject {
    
    func photoSelectionCanceled()
    
    func didFailWithError(_ error: PhotosError)
    func didFailToGetPermission(_ error: PhotosError)
    
    func didUserSelectImage(_ image: UIImage)
    
    func didPhotoSelectionCompleted()
}

typealias ImageFetchClosure = (_ image: UIImage?) -> Void

typealias PhotoAuthStatus = (isAllowed: Bool, isLimited: Bool)

final class PhotoSelectionController: NSObject {
    
    weak var delegate: PhotoSelectionControllerDelegate?
    
    var phManager: PHImageManager = PHImageManager.default()
    var library: PHPhotoLibrary = PHPhotoLibrary.shared()
    
    // MARK: - Life cycle
    deinit {
        removePhotoLibraryAuthrozationStatusObserving()
    }
    
    override init() {
        super.init()
        // setupPhotoLibraryAuthrozationStatusObserving()
    }
    
}

// MARK: - PhotoSelectionControllerProtocol
extension PhotoSelectionController: PhotoSelectionControllerProtocol {
    
    func setupPhotoLibraryAuthrozationStatusObserving() {
        
        // NOTE: - Will trigger permission popup for photos, do not use
        if #available(iOS 13, *) {
            library.register(self as PHPhotoLibraryAvailabilityObserver)
        }
        library.register(self as PHPhotoLibraryChangeObserver)
    }
    
    func removePhotoLibraryAuthrozationStatusObserving() {
        
        if #available(iOS 13, *) {
            library.unregisterAvailabilityObserver(self)
        }
        library.unregisterChangeObserver(self)
    }
    
    func checkCameraAccess(at vc: UIViewController, completion: @escaping ((Bool) -> Void)) {
        
        guard AVCaptureDevice.default(for: .video) != nil else {
            delegate?.didFailWithError(PhotosError.cameraNotAvailable)
            completion(false)
            return
        }
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .denied, .restricted:
            delegate?.didFailToGetPermission(PhotosError.cameraAcccessDenied)
            completion(false)
        case .authorized:
            completion(true)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] success in
                if !success {
                    self?.delegate?.didFailToGetPermission(PhotosError.cameraAcccessDenied)
                }
                completion(success)
            }
            
        @unknown default:
            break
        }
    }
    
    func checkPhotosAccess(at vc: UIViewController, completion: @escaping ((PhotoAuthStatus) -> Void)) {
        
        let status: PHAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        } else {
            status = PHPhotoLibrary.authorizationStatus()
        }
        
        switch status {
        case .authorized:
            
            completion((isAllowed: true, isLimited: false))
            
        case .limited:
            
            if #available(iOS 14.0, *) {
                
                completion((isAllowed: true, isLimited: true))
                
            } else {
                
                completion((isAllowed: true, isLimited: true))
            }
            
             completion((isAllowed: true, isLimited: true))
            
        case .denied, .restricted:
            
            delegate?.didFailToGetPermission(PhotosError.photoLibraryAccessDenied)
            completion((isAllowed: false, isLimited: false))
            
        case .notDetermined:
            
            requestPhotoLibraryAuthorization(at: vc, completion: completion)
            
        @unknown default:
            break
        }
    }
    
    func requestPhotoLibraryAuthorization(at vc: UIViewController, completion: @escaping ((PhotoAuthStatus) -> Void)) {
        
        if #available(iOS 14.0, *) {
            
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { [weak self] status in
                
                self?.handlePhotoLibraryAuthorizationStatus(at: vc, status: status, completion: completion)
                
            }
            
        } else {
            
            PHPhotoLibrary.requestAuthorization { [weak self] status in
                
                self?.handlePhotoLibraryAuthorizationStatus(at: vc, status: status, completion: completion)
                
            }
            
        }
        
    }
    
    private func handlePhotoLibraryAuthorizationStatus(at vc: UIViewController,
                                                       status: PHAuthorizationStatus,
                                                       completion: @escaping ((PhotoAuthStatus) -> Void)) {
        
        switch status {
        case .authorized:
            completion((isAllowed: true, isLimited: false))
            
        case .limited:
            
            if #available(iOS 14.0, *) {
                
                completion((isAllowed: true, isLimited: true))
                
            } else {
                
                completion((isAllowed: true, isLimited: true))
            }
            
        case .denied, .restricted:
            delegate?.didFailToGetPermission(PhotosError.photoLibraryAccessDenied)
            completion((isAllowed: false, isLimited: false))
            
        case .notDetermined:
            break // won't happen but still
        @unknown default:
            break
        }
    }
    
}

// MARK: - PHPhotoLibraryChangeObserver
extension PhotoSelectionController: PHPhotoLibraryChangeObserver {
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        // NOTE: - For cases while you present custom UI - trigger updates methods from here
    }
    
}

// MARK: - PHPhotoLibraryAvailabilityObserver
extension PhotoSelectionController: PHPhotoLibraryAvailabilityObserver {
    
    @available(iOS 13, *)
    func photoLibraryDidBecomeUnavailable(_ photoLibrary: PHPhotoLibrary) {
        // NOTE: - For cases while you present custom UI - trigger updates methods from here
    }
    
}

// MARK: - UIImagePickerControllerDelegate + UINavigationControllerDelegate
extension PhotoSelectionController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        // NOTE: image captured by device camera do not have image URL
        handleCapturedImage(picker, info: info)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        delegate?.photoSelectionCanceled()
    }
    
    private func handleCapturedImage(_ picker: UIImagePickerController,
                                     info: [UIImagePickerController.InfoKey: Any]) {
        
        var selectedImage: UIImage?
        let editedImage = info[.editedImage] as? UIImage
        
        if editedImage?.jpegData(compressionQuality: 1.0) == nil {
            // Image was NOT edited
            guard let image = info[.originalImage] as? UIImage else {
                assertionFailure("Unable to get image")
                return
            }
            selectedImage = image
            
        } else {
            // Image was edited
            guard let image = info[.editedImage] as? UIImage else {
                assertionFailure("Unable to get image")
                return
            }
            selectedImage = image
        }
        guard let image = selectedImage else {
            assertionFailure("Image wasn't provided")
            return
        }
        
        delegate?.didUserSelectImage(image)
        picker.dismiss(animated: true) { [unowned self] in
            self.delegate?.didPhotoSelectionCompleted()
        }
        
    }
    
}

// MARK: - PHPickerViewControllerDelegate
extension PhotoSelectionController: PHPickerViewControllerDelegate {
    
    // NOTE: - Single photo selection handling
    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        // Empty results - user canceled photo selection
        guard results.isEmpty else {
         
            guard let itemProvider = results.first?.itemProvider else {
                
                self.failedToLoadImage(with: PhotosError.failedToLoadFile)
                return
            }
            
            guard itemProvider.hasItemConformingToTypeIdentifier(kUTTypeImage as String) else {
                
                self.failedToLoadImage(with: PhotosError.failedToLoadFile)
                return
            }
            
            itemProvider.loadItem(forTypeIdentifier: kUTTypeImage as String, options: nil) { [weak self] imageUrl, error in
                
                guard let err = error else {
                    
                    guard (imageUrl as? URL) != nil else {
                        
                        self?.failedToLoadImage(with: PhotosError.failedToLoadFile)
                        return
                    }
                    
                    self?.loadUIImage(for: itemProvider)
                    
                    return
                }
                
                let error = PhotosError.systemError(message: err.localizedDescription)
                self?.failedToLoadImage(with: error)
            }
            
            return
        }
        
        delegate?.photoSelectionCanceled()
        
    }
    
    private func loadUIImage(for itemProvider: NSItemProvider) {
        
        guard itemProvider.canLoadObject(ofClass: UIImage.self) else {
            
            failedToLoadImage(with: PhotosError.failedToLoadFile)
            return
        }
        
        let _ = itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
            
            guard let err = error else {
                
                guard let img = image as? UIImage else {
                    
                    self?.failedToLoadImage(with: PhotosError.failedToLoadFile)
                    return
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.didUserSelectImage(img)
                    self?.delegate?.didPhotoSelectionCompleted()
                }
                
                return
            }
            
            let error = PhotosError.systemError(message: err.localizedDescription)
            self?.failedToLoadImage(with: error)
        }
    }
    
    private func failedToLoadImage(with error: PhotosError) {
        
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.didFailWithError(error)
            self?.delegate?.photoSelectionCanceled()
        }
    }
    
}
