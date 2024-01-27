//
//  PhotoSelectionControllerProtocol.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 27.01.2024.
//  Copyright © 2024 Dmytro Geienko. All rights reserved.
//

import Photos
import PhotosUI
import UIKit

protocol PhotoSelectionControllerProtocol: AnyObject {
    
    var delegate: PhotoSelectionControllerDelegate? { get set }
    
    var phManager: PHImageManager { get set }
    var library: PHPhotoLibrary { get set }

    func setupPhotoLibraryAuthrozationStatusObserving()
    func removePhotoLibraryAuthrozationStatusObserving()
    
    func checkCameraAccess(at vc: UIViewController, completion: @escaping ((Bool) -> Void))
    
    func checkPhotosAccess(at vc: UIViewController, completion: @escaping ((PhotoAuthStatus) -> Void))
    
    func requestPhotoLibraryAuthorization(at vc: UIViewController, completion: @escaping ((PhotoAuthStatus) -> Void))
    
}
