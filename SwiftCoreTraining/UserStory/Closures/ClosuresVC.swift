//
//  ClosuresVC.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 09.11.2020.
//  Copyright © 2020 chrisik. All rights reserved.
//

import UIKit

final class ClosuresVC: BaseViewController {
    
    private lazy var contentView: ClosuresVCView = ClosuresVCView()
    private lazy var viewModel: ClosuresVCViewModel = ClosuresVCViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // viewModel.valuesCapturing()
        viewModel.valuesCapturingWithGCD()
    }
    
}
