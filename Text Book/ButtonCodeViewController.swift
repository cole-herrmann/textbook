//
//  ButtonCodeViewController.swift
//  TextBook
//
//  Created by Cole Herrmann on 9/27/14.
//  Copyright (c) 2014 Cole Herrmann. All rights reserved.
//

import UIKit

class ButtonCodeViewController: ViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    var topView = UIView()
    var bottomView = UIView()
    var topButton = UIButton()
    var bottomButton = UIButton()
    var isScanner: Bool?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = UIView()
        self.view.backgroundColor = .clearColor()
        


    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
                
        self.layoutTheView()
        
    }
    
    func layoutTheView(){
        
        topView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)
        topView.backgroundColor = UIColor(red: CGFloat(0.133), green: CGFloat(0.204), blue: CGFloat(0.294), alpha: CGFloat(1))
        
        topButton.frame = CGRectMake(0, topView.frame.height - 100, topView.frame.width, 100)
        topButton.backgroundColor = UIColor(red: CGFloat(0.616), green: CGFloat(0.239), blue: CGFloat(0.235), alpha: CGFloat(1))
        topButton.setTitle("Sell Text Book", forState: .Normal)
        topButton.addTarget(self, action: Selector("transitionToScannerOrSeller:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        bottomView.frame = CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2)
        bottomView.backgroundColor = UIColor(red: CGFloat(0.133), green: CGFloat(0.204), blue: CGFloat(0.294), alpha: CGFloat(1))
        
        bottomButton.frame = CGRectMake(0, 0, bottomView.frame.width, 100)
        bottomButton.backgroundColor = UIColor(red: CGFloat(0.902), green: CGFloat(0.824), blue: CGFloat(0.718), alpha: CGFloat(1))
        bottomButton.setTitle("Buy Text Book", forState: .Normal)
        bottomButton.addTarget(self, action: Selector("transitionToScannerOrSeller:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(topView)
        self.view.addSubview(bottomView)
        
        topView.addSubview(topButton)
        bottomView.addSubview(bottomButton)
    }
    
    func transitionToScannerOrSeller(sender: AnyObject!){
        navigationController?.delegate = self
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController?
        if(sender as UIButton == topButton){
            isScanner = true
            vc = storyBoard.instantiateViewControllerWithIdentifier("ScannerVC") as ScannerViewController
        }else{
            isScanner = false
            vc = storyBoard.instantiateViewControllerWithIdentifier("BookListVC") as BookListViewController
        }
        showViewController(vc!, sender: self)

    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        var animator = SplitAnimator()
        
        animator.isScanner = self.isScanner
        
        return animator
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        self.navigationController?.delegate = nil
        self.layoutTheView()

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.BlackOpaque;
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
}
