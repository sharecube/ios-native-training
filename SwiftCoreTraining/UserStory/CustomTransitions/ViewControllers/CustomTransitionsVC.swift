//
//  CustomTransitionsVC.swift
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 4/14/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

import UIKit

final class CustomTransitionsVC: UIViewController {
    
    let contentView = CustomTransitionsView()
    
    deinit {
        contentView.imageView.gestureRecognizers?.forEach {
            contentView.imageView.removeGestureRecognizer($0)
        }
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        setupAction()
    }
    
    private func setupAction() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        contentView.imageView.isUserInteractionEnabled = true
        contentView.imageView.addGestureRecognizer(tap)
    }
    
    @objc func didTapImage() {
        let vc = TransitionPushVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension CustomTransitionsVC: UINavigationControllerDelegate {
    
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        switch operation {
        case .none:
            return nil
        case .push:
            guard let fromVC = fromVC as? CustomTransitionsVC else { return nil }
            guard let toVC = toVC as? TransitionPushVC else { return nil }
            return ZoomPushAnimator(duration: 1.0, viewToZoom: fromVC.contentView.imageView,
                                    endSize: toVC.contentView.bigImageView.bounds)

//            guard let fromVC = fromVC as? CustomTransitionsVC else { return nil }
//            return FadePushAnimator(duration: 0.5, viewsToHide: [fromVC.contentView.imageView])
            
//            return CustomAnimator(duration: 1.0, isPresenting: true)
        case .pop:
            
            guard let fromVC = fromVC as? TransitionPushVC else { return nil }
            guard let toVC = toVC as? CustomTransitionsVC else { return nil }
            return ZoomPopAnimator(duration: 1.0, viewToZoomOut: fromVC.contentView.bigImageView, endViewSize: toVC.contentView.imageView.bounds, viewToRestore: toVC.contentView.imageView)
            
//            guard let fromVC = fromVC as? TransitionPushVC else { return nil }
//            guard let toVC = toVC as? CustomTransitionsVC else { return nil }
//            return FadePopAnimator(duration: 0.5,
//                                   viewsToHide: [fromVC.contentView.bigImageView],
//                                   viewsToShow: [toVC.contentView.imageView])
            
//            return CustomAnimator(duration: 1.0, isPresenting: false)
        }
        
    }
}
