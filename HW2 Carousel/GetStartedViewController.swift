//
//  GetStartedViewController.swift
//  HW2 Carousel
//
//  Created by Stacey Adams on 2/14/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var checboxUnchecked1: UIImageView!
    @IBOutlet weak var checboxUnchecked2: UIImageView!
    @IBOutlet weak var checboxUnchecked3: UIImageView!
    
    @IBOutlet weak var checboxChecked1: UIImageView!
    @IBOutlet weak var checboxChecked2: UIImageView!
    @IBOutlet weak var checboxChecked3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onCloseDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
        })
    }

    @IBAction func checkboxButton1DidPress(sender: AnyObject) {
        checboxUnchecked1.alpha = 0
        checboxChecked1.alpha = 1
    }
    
    @IBAction func checkboxButton2DidPress(sender: AnyObject) {
        checboxUnchecked2.alpha = 0
        checboxChecked2.alpha = 1
    }
    
    @IBAction func checkboxButton3DidPress(sender: AnyObject) {
        checboxUnchecked3.alpha = 0
        checboxChecked3.alpha = 1
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
