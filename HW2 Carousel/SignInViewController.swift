//
//  SignInViewController.swift
//  HW2 Carousel
//
//  Created by Stacey Adams on 2/11/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var signInContainer: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButtons: UIButton!

    var originalLoginYCenter: CGFloat!
    var originalButtonsYCenter: CGFloat!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalLoginYCenter = loginContainer.center.y
        originalButtonsYCenter = signInContainer.center.y
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    // Shift up elements so they are still visible when the keyboard comes up
    

    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.loginContainer.center.y = 83
            self.signInContainer.center.y = 250
            
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.loginContainer.center.y = self.originalLoginYCenter
            self.signInContainer.center.y = self.originalButtonsYCenter
            
            }, completion: nil)
    }
    
    
 
    // Do stuff when password fields are entered and Sign In button is pressed
    
    func checkPassword() {
        //show alert for "signing in...", then dismiss after a wait
        var alertViewLoading = UIAlertView(title: "Signing In...", message: nil, delegate: nil, cancelButtonTitle: nil)
        alertViewLoading.show()
        delay(2, { () -> () in
            alertViewLoading.dismissWithClickedButtonIndex(0, animated: true)
        })
    }
    
    @IBAction func SignInDidPress(sender: AnyObject) {
 
            if (self.emailTextField.text == "e@mail.com" && self.passwordTextField.text == "pass") {
                checkPassword()
                // after waiting for the signing in alert to dismiss, go to the next screen
                delay(2, { () -> () in
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                })
            }
                
            else if (self.emailTextField.text.isEmpty || self.passwordTextField.text.isEmpty) {
                // immediately show error for blank fields
                var alertView = UIAlertView(title: "Email and Password Required", message: "Make sure to fill in both.", delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
                        }
                
            else {
                checkPassword()
                // after waiting for the signing in alert to dismiss, show error alert
                delay(2, { () -> () in
                    var alertView = UIAlertView(title: "Try Again", message: "Incorrect email/password", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                })
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