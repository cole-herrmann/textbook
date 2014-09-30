//
//  ScannerViewController.swift
//  TextBook
//
//  Created by Cole Herrmann on 9/27/14.
//  Copyright (c) 2014 Cole Herrmann. All rights reserved.
//

import UIKit

class ScannerViewController: ViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.hidesBackButton = true
        navigationItem.title = "Sell"
        navigationController?.setNavigationBarHidden(false, animated: true)

        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Buy", style: UIBarButtonItemStyle.Plain, target: self, action:"switchToBuy:")

        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    func switchToBuy(sender: UIBarButtonItem) {

        navigationController?.setNavigationBarHidden(true, animated: true)

//        navigationController?.delegate = self
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewControllerWithIdentifier("BookListVC") as BookListViewController
        showViewController(vc, sender: self)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
//
//    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        
//        self.navigationController?.delegate = nil
////        var animator = SwitchToBuyAnimator()
//        return animator
//    }

    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.BlackOpaque;
    
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}
