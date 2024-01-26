//
//  BaseNavigationController.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 03.03.2020.
//  Copyright © 2020 chrisik. All rights reserved.
//

import UIKit

protocol BaseNavigationController: UINavigationController {
    
}

// NOTE: Do not remove it - required for Coordinator implementation
extension UINavigationController: BaseNavigationController {
    
}
