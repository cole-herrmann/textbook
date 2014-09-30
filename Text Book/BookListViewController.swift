//
//  BookListViewController.swift
//  TextBook
//
//  Created by Cole Herrmann on 9/28/14.
//  Copyright (c) 2014 Cole Herrmann. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {

    @IBOutlet var bookListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Buy"
        navigationController?.setNavigationBarHidden(false, animated: true)
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sell", style: UIBarButtonItemStyle.Plain, target: self, action:"switchToSell:")


    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:  BookTableViewCell = tableView.dequeueReusableCellWithIdentifier("BookCell") as BookTableViewCell
        
        cell.titleLabel.text = "Calculus 3"
        cell.editionLabel.text = "12th edition"
        cell.priceLabel.text = "$70.00"
        cell.bookImage.image = UIImage(named: "calc")
        
        return cell
        
    }
    
    func switchToSell(sender: UIBarButtonItem) {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
//        navigationController?.delegate = self
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewControllerWithIdentifier("ScannerVC") as ScannerViewController
        showViewController(vc, sender: self)
    }
    
    
//    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        
//        self.navigationController?.delegate = nil
//        var animator = SwitchToBuyAnimator()
//        return animator
//    }
    

    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.BlackOpaque;
        
    }
    
    override func prefersStatusBarHidden() -> Bool {

        return false
    
    }


}
