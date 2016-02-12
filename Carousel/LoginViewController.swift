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
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var signinIndicator: UIActivityIndicatorView!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -100
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
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
    
    @IBAction func didPressSignin(sender: AnyObject) {
        signinIndicator.stopAnimating()
        signinButton.selected = true
        if emailField.text!.isEmpty {
            let emailAlertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            emailAlertController.addAction(OKAction)
            self.presentViewController(emailAlertController, animated: true){
                
            }
        } else if passwordField.text!.isEmpty {
            let passAlertController = UIAlertController(title: "Password Required", message: "Please enter your password", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
            }
            passAlertController.addAction(OKAction)
            self.presentViewController(passAlertController, animated: true){
                
            }
            
        } else {
            signinIndicator.startAnimating()
        }
        if emailField.text == "a@a.com" && passwordField.text == "asdf" {
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.signinIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.signinButton.selected = false
                // perform the Segue to the next screen.
                self.performSegueWithIdentifier("tutorialSegue", sender: nil)
            })
        } else {
            self.signinIndicator.stopAnimating()
            self.signinButton.selected = false
             let loginAlertController = UIAlertController(title: "Authentication Failed", message: "Please try again", preferredStyle: .Alert)
            let RetryAction = UIAlertAction(title: "Retry", style: .Default) { (action) in
                // handle response here.
            }
            loginAlertController.addAction(RetryAction)
            self.presentViewController(loginAlertController, animated: true){
                
            }

        }
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
