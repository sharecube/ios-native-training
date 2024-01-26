//
//  MemoryManagmentVC.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 07.02.2021.
//  Copyright © 2021 chrisik. All rights reserved.
//

import UIKit

final class MemoryManagmentVC: UIViewController {
    
    private let viewModel = MemoryManagmentViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.task1()
    }
    
}
