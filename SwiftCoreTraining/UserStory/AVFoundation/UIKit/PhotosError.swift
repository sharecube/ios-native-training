//
//  PhotosError.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 27.01.2024.
//  Copyright © 2024 Dmytro Geienko. All rights reserved.
//

import Foundation

enum PhotosError: Error, LocalizedError {
    
    case cameraNotAvailable
    case cameraAcccessDenied
    case photoLibraryAccessDenied
    case failedToLoadFile
    case unsupportedFileFormat
    case systemError(message: String)
    
    var description: String {
        switch self {
        case .cameraNotAvailable:
            return "Camera not available"
        case .cameraAcccessDenied:
            return "Camera access was denied"
        case .photoLibraryAccessDenied:
            return "Photos access was denied"
        case .failedToLoadFile:
            return "Unable to fetch selected image file"
        case .unsupportedFileFormat:
            return "Unsupported image format"
        case .systemError(let message):
            return message
        }
    }
    
    var errorDescription: String? {
        return self.description
    }
    
}
