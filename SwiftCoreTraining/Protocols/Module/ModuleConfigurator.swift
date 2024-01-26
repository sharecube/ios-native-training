//
//  ModuleConfigurator.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 03.03.2020.
//  Copyright © 2020 chrisik. All rights reserved.
//

import Foundation

protocol ModuleConfigurator {
    associatedtype ModuleType
    static func makeModule() -> ModuleType
}
