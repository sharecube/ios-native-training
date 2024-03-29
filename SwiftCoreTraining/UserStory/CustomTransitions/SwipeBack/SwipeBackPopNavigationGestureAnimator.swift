//
//  SwipeBackPopNavigationGestureAnimator.swift
//  SwiftCoreTraining
//
//  Created by  Dmytro Geienko on 13/02/2020.
//  Copyright © 2020 chrisik. All rights reserved.
//

import UIKit

final class PopNavigationGestureAnimator: NSObject {
    
    var transitionTime: TimeInterval = 0.3
    
    private let presenting: Bool
    
    init(presenting: Bool) {
        self.presenting = presenting
    }
    
}

// MARK: - UIViewControllerAnimatedTransitioning
extension PopNavigationGestureAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }

        let duration = transitionDuration(using: transitionContext)

        let container = transitionContext.containerView
        if presenting {
            container.addSubview(toView)
        } else {
            container.insertSubview(toView, belowSubview: fromView)
        }

        let toViewFrame = toView.frame
        let xCoordinate = presenting ? toView.frame.width : -toView.frame.width
        toView.frame = CGRect(x: xCoordinate, y: toView.frame.origin.y, width: toView.frame.width, height: toView.frame.height)

        let animations = {

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                toView.frame = toViewFrame
                let xCoordinate = self.presenting ? -fromView.frame.width : fromView.frame.width
                fromView.frame = CGRect(x: xCoordinate, y: fromView.frame.origin.y, width: fromView.frame.width, height: fromView.frame.height)
            }

        }

        UIView.animateKeyframes(withDuration: duration,
                                delay: 0,
                                options: .calculationModeCubic,
                                animations: animations,
                                completion: { _ in
                                    
                                    container.addSubview(toView)
                                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}
