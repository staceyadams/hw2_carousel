//
//  WelcomeViewController.swift
//  HW2 Carousel
//
//  Created by Stacey Adams on 2/12/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit



class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var welcome1: UIImageView!
    @IBOutlet weak var welcome2: UIImageView!
    @IBOutlet weak var welcome3: UIImageView!
    @IBOutlet weak var welcome4: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupButtonContainer: UIView!
    @IBOutlet weak var backupButton: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var page = Int(scrollView.contentOffset.x / 320)
        pageControl.currentPage = page
        //println(page)
        // on page 4, hide the page control and show the button
        if (page == 3) {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.pageControl.alpha = 0
                self.backupButtonContainer.alpha = 1
            })
        }
        else {
            pageControl.alpha = 1
            backupButtonContainer.alpha = 0
        }

        
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
