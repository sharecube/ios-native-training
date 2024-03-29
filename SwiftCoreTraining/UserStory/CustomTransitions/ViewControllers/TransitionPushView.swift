//
//  TransitionPushView.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 4/14/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

import UIKit

final class TransitionPushView: UIView {
    
    let bigImageView = UIImageView()
    
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
        addSubview(bigImageView)
        bigImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(UIScreen.main.bounds.width)
        }
        bigImageView.image = R.image.avatarPlaceholder()
    }
}
