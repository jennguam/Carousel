//
//  IntroViewController.swift
//  Carousel
//
//  Created by Jenn Leung on 2/10/16.
//  Copyright © 2016 Jenn Leung. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introPage: UIImageView!
    @IBOutlet weak var peopleTile: UIImageView!
    @IBOutlet weak var mountainTile: UIImageView!
    @IBOutlet weak var deerTile: UIImageView!
    @IBOutlet weak var dogTile: UIImageView!
    @IBOutlet weak var fishTile: UIImageView!
    
        @IBOutlet weak var purpleMountains: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = introPage.image!.size
        print(scrollView.contentSize)
        purpleMountains.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1.7, 1.7), CGFloat(15 * M_PI / 180))
        dogTile.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1.7, 1.7), CGFloat(-15 * M_PI / 180))
        fishTile.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1.7, 1.7), CGFloat(15 * M_PI / 180))
        peopleTile.transform =  CGAffineTransformMakeRotation(CGFloat(15 * M_PI / 180))
        mountainTile.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1.7, 1.7), CGFloat(-15 * M_PI / 180))
       
        deerTile.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1.7, 1.7), CGFloat(15 * M_PI / 180))
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
