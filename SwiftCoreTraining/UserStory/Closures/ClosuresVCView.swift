//
//  ClosuresVCView.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 09.11.2020.
//  Copyright © 2020 chrisik. All rights reserved.
//

import SnapKit
import UIKit

final class ClosuresVCView: UIView {
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        setupLayout()
    }
    
    private func setupLayout() {
        
    }
    
}
