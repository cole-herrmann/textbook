//
//  ViewController.swift
//  TextBook
//
//  Created by Cole Herrmann on 9/26/14.
//  Copyright (c) 2014 Cole Herrmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var signInWidthConstraint: NSLayoutConstraint!
    @IBOutlet var signInBottomConstraint: NSLayoutConstraint!
    @IBOutlet var textBookLabel: UILabel!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var facebookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        if var mySignInButton = signInButton {
            mySignInButton.layer.borderColor = UIColor.whiteColor().CGColor
            mySignInButton.layer.borderWidth = 1.0
            mySignInButton.layer.cornerRadius = 5.0

            
        }
        
        if var mySignUpButton = signUpButton {
            mySignUpButton.layer.borderColor = UIColor.whiteColor().CGColor
            mySignUpButton.layer.borderWidth = 1.0
            mySignUpButton.layer.cornerRadius = 5.0
            
        }
        
        if var myFBButton = facebookButton {
            myFBButton.layer.cornerRadius = 5.0
        }
        
        if var myLabel = textBookLabel {
            myLabel.layer.cornerRadius = 5.0
            myLabel.layer.masksToBounds = true
        }
        
    }
    
    
    @IBAction func goToButtonScreen(sender: AnyObject) {
//        if(sender as UIButton == signInButton){
//            signInBottomConstraint.constant = 300
//            signInWidthConstraint.constant = textBookLabel.frame.size.width
//            UIView.animateWithDuration(1, animations: { () -> Void in
//                self.signUpButton.alpha = 0
//                self.facebookButton.alpha = 0
//                self.textBookLabel.alpha = 0
//                self.view.layoutIfNeeded()
//            })
//        }else{
            navigationController?.showViewController(ButtonCodeViewController(), sender: self)
//        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

