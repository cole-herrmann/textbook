//
//  SplitAnimator.swift
//  TextBook
//
//  Created by Cole Herrmann on 9/27/14.
//  Copyright (c) 2014 Cole Herrmann. All rights reserved.
//

import Foundation
import UIKit

class SplitAnimator: NSObject, UIViewControllerAnimatedTransitioning{
    
    var isScanner: Bool?
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC: ButtonCodeViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as ButtonCodeViewController
        var toVC: UIViewController
        if(isScanner!){
            toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as ScannerViewController
        }else{
            toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as BookListViewController
        }
        
        transitionContext.containerView().addSubview(toVC.view)
        transitionContext.containerView().addSubview(fromVC.view)
        
        toVC.view.transform = CGAffineTransformMakeScale(0.85, 0.85)
        toVC.view.alpha = 0.6
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            
            fromVC.topView.frame = CGRectMake(0, -fromVC.view.frame.size.height/2, fromVC.view.frame.size.width, fromVC.view.frame.size.height/2)
            fromVC.bottomView.frame = CGRectMake(0, fromVC.view.frame.height, fromVC.view.frame.size.width, fromVC.view.frame.size.height/2)
            
            toVC.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
            toVC.view.alpha = 1.0
            
            }, completion: {
                (value: Bool) in
                transitionContext.completeTransition(true)
        })

    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.7;
    }
    
}