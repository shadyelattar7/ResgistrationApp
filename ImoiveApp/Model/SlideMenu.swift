//
//  SlideMenu.swift
//  ImoiveApp
//
//  Created by Elattar on 7/19/19.
//

import UIKit

class SlideMenu: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresenting = false
    var dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        
        
        let containerView = transitionContext.containerView
        let finalWidth = toViewController.view.bounds.width * 0.7
        let finalHight = toViewController.view.bounds.height
        
        if isPresenting {
            //Add a dimming view
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            
            // Add menu view controller to container
            containerView.addSubview(toViewController.view)
            
            //init frame off the screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHight)
        }
        
            //Animate on Screen
            let transform = {
                self.dimmingView.alpha = 0.5
                toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
                
            }
        
        
            //Animate back of Screen
            let identity = {
                self.dimmingView.alpha = 0.0
                fromViewController.view.transform = .identity
            }
            
            //Animate of the transition
            let duration = transitionDuration(using: transitionContext)
            let isCancelled = transitionContext.transitionWasCancelled
            UIView.animate(withDuration: duration, animations: {
                self.isPresenting ? transform() : identity()
            }) { (_) in
                transitionContext.completeTransition(!isCancelled)
            }
        }
    
    
}
