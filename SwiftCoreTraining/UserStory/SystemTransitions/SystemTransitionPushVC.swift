//
//  SystemTransitionPushVC.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 4/15/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

import UIKit

final class SystemTransitionPushVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .green
        navigationController?.addFlipTransition()
    }
    
}
