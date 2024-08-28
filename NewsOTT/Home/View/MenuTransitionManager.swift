//
//  MenuTransitionManager.swift
//  NewsOTT
//
//  Created by Khaled on 23/10/23.
//

import Foundation
import UIKit

class MenuTransitionManager: NSObject, UIViewControllerTransitioningDelegate {
    
    private let slideAnimation = SlideAnimation()
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideAnimation.isPresenting = true
        return slideAnimation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideAnimation.isPresenting = false
        return slideAnimation
    }
}

class SlideAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let key: UITransitionContextViewControllerKey = isPresenting ? .to : .from
        guard let presentedController = transitionContext.viewController(forKey: key) else {
            return
        }
        
        let containerView = transitionContext.containerView
        let presentedFrame = transitionContext.finalFrame(for: presentedController)
        let dismissedFrame = presentedFrame.offsetBy(dx: -presentedFrame.width, dy: 0)
        
        if isPresenting {
            containerView.addSubview(presentedController.view)
        }
        
        let duration = transitionDuration(using: transitionContext)
        let wasCancelled = transitionContext.transitionWasCancelled
        
        let fromFrame = isPresenting ? dismissedFrame : presentedFrame
        let toFrame = isPresenting ? presentedFrame : dismissedFrame
        
        presentedController.view.frame = fromFrame
        
        UIView.animate(withDuration: duration) {
            presentedController.view.frame = toFrame
        } completion: { (_) in
            transitionContext.completeTransition(!wasCancelled)
        }
    }
}

class CustomSizePresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let bounds = containerView?.bounds else { return .zero }
        return CGRect(x: .zero, y: .zero, width: bounds.width, height: bounds.height)
    }
}
