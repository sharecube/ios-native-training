//
//  CustomTransitionsView.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 4/14/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

import UIKit
import SnapKit

final class CustomTransitionsView: UIView {
    
    let image = R.image.avatarPlaceholder()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .white
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        
    }
    
}
