//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Jenn Leung on 2/12/16.
//  Copyright © 2016 Jenn Leung. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        buttonParentView.alpha = 0
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on scroll event
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            pageControl.hidden = true
            UIView.animateWithDuration(0.3) { () -> Void in
                self.buttonParentView.alpha = 1
                self.pageControl.hidden = true
            }
        }


    }

}
