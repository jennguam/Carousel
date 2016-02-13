//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Jenn Leung on 2/12/16.
//  Copyright © 2016 Jenn Leung. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 875)
        // Do any additional setup after loading the view.
    }
    @IBAction func onClose(sender: AnyObject) {
         dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSignOut(sender: AnyObject) {
        let alertController = UIAlertController(title: "Are you sure you want to log out?", message: "", preferredStyle: .ActionSheet)
        // add the logout action to the alert controller
        let logoutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("LogOut", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        
        alertController.addAction(logoutAction)
        alertController.addAction(cancelAction)
        
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
