//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    var signupState = false
    
    
    func displayAlert(title: String, message: String) {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var signup: UIButton!
    
    @IBOutlet weak var signUpToggledButton: UIButton!

        
    @IBAction func signupButon(sender: UIButton) {
        
        
        
        if userName.text == "" || password.text == "" {
            
            displayAlert("Missing Text Field(s)", message: "username, password or both are required")
            
            
        } else {
            
            
                
                var user = PFUser()
                user.username = userName.text
                user.password = password.text
                
                
            
                
                user.signUpInBackgroundWithBlock {
                    (succeded, error) -> Void in
                    if let error = error {
                        if let errorString = error.userInfo["error"] as? String {
                            
                            self.displayAlert("Sign Up Failed", message: errorString)
                            
                        }
                        
                        if succeded {
                            self.performSegueWithIdentifier("loginDriver", sender: self)
                        
                        
                    
                
            } else {
                PFUser.logInWithUsernameInBackground(userName.text!, password: password.text!) {
                    (user: PFUser?, error: NSError?) -> Void in
                    if let user = user {
                        
                        if user["isDriver"]! as! Bool == true {
                            self.performSegueWithIdentifier("loginDriver", sender: self)
                            
                            
                        } else {
                            self.performSegueWithIdentifier("loginRider", sender: self)
                            
                            
                            
                            
                            
                        }
                        
                    } else {
                        if let errorString = error?.userInfo["error"] as? String {
                            
                            self.displayAlert("Login Failed", message: errorString)
                            
                            
                            
                        }
                    }
                }
                
                
            }
        }
    }
    
    

        
        
        
        
        
        
        
    }
        
    @IBAction func signUpToggled(sender: UIButton) {
        
        
        if sig == true {
            signup.setTitle("Log In", forState: UIControlState.Normal)
            
           signUpToggledButton.setTitle("Switch to Signup", forState: UIControlState.Normal)
            signupActive = false
            
            
            
        } else {
            
            signup.setTitle("Sign Up", forState: UIControlState.Normal)
            
            signUpToggledButton.setTitle("Switch to Login", forState: UIControlState.Normal)
            
             = true
        }
        
        
        
    }
    
    
        
        
        
        
        
    
   
        
        
        
        
        
        
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
 
    
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

