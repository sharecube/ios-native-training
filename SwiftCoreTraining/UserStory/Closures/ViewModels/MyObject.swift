//
//  MyObject.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 07.02.2021.
//  Copyright © 2021 chrisik. All rights reserved.
//

import Foundation

//final class MyObject {
//
//    var name: String
//
//    init(name: String) {
//
//        self.name = name
//    }
//}

struct MyObject {

    var name: String

    var description: String {
        return UUID().uuidString
    }

    init(name: String) {
        self.name = name
    }

}
