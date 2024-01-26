//
//  ViperView.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 6/16/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

import UIKit
import SnapKit

final class ViperView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
