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
    @IBOutlet weak var signInButtons: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var originalLoginFieldsYCenter: CGFloat!
    var originalLoginButtonsYCenter: CGFloat!
    

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
       originalLoginFieldsYCenter = loginContainer.center.y
       originalLoginButtonsYCenter = signInButtons.center.y
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
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
    
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        // make the anim smooth
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
        // Shift login fields and sign in buttons up
        self.signInButtons.center.y = self.signInButtons.center.y - kbSize.height
        self.loginContainer.center.y = self.loginContainer.center.y - 50
            
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
            
            // Brings the login back to where it was when we started
            self.loginContainer.center.y = self.originalLoginFieldsYCenter
            }, completion: nil)
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