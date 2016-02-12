//
//  LoginViewController.swift
//  Carousel
//
//  Created by Jenn Leung on 2/11/16.
//  Copyright © 2016 Jenn Leung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    @IBOutlet weak var buttonParentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
        
        print(scrollView.contentOffset.y)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
        scrollViewDidScroll(scrollView)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("scroll")
        // If the scrollView has been scrolled down by 50px or more...
        
        if scrollView.contentOffset.y <= -20 {
            // Hide the keyboard
            print("scrolled past 20")
            view.endEditing(true)
        }
        
    }



}
