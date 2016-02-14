//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by Jenn Leung on 2/12/16.
//  Copyright © 2016 Jenn Leung. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var createAcctButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 130
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -230
        

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
    
    @IBAction func onBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func keyboardWillHide(notification: NSNotification) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
        scrollViewDidScroll(scrollView)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        
        if scrollView.contentOffset.y <= -20 {
            // Hide the keyboard
            print("scrolled past 20")
            view.endEditing(true)
        }
        
    }
    @IBAction func onAgree(sender: AnyObject) {
        checkBoxButton.selected = !checkBoxButton.selected
    }


}
