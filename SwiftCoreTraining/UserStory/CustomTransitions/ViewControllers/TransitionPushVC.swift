//
//  TransitionPushVC.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 4/14/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

import UIKit

final class TransitionPushVC: UIViewController {
    
    let contentView = TransitionPushView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
