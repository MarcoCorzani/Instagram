//
//  ViewController.swift
//  Instagram
//
//  Created by Marco F.A. Corzani on 06.02.15.
//  Copyright (c) 2015 Alphaweb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var signUpActive = true
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
   
        
  
    
    func displayAlert(title:String, error:String) {
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    @IBOutlet weak var username: UITextField!
   
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var alreadyRegistered: UILabel!
    
    
    @IBOutlet weak var signUpToggleButton: UIButton!
    
    
    @IBAction func toggleSignUp(sender: AnyObject) {
   
    
        if signUpActive == true {
            
            signUpActive = false
            
            signUpLabel.text = "Use the form below to Log In"
            
            signUpButton.setTitle("Log In", forState: UIControlState.Normal)
            
            alreadyRegistered.text = "Not already registered?"
            
            signUpToggleButton.setTitle("Sign Up", forState: UIControlState.Normal)
            
            
        
        } else {
        
            signUpActive = true
            
            signUpLabel.text = "Use the form below to Sign In"
            
            signUpButton.setTitle("Sign In", forState: UIControlState.Normal)
            
            alreadyRegistered.text = "Already registered?"
            
            signUpToggleButton.setTitle("Log In", forState: UIControlState.Normal)

        
        }
    
    }
    
    
    @IBAction func signup(sender: AnyObject) {
    
        var lang = countElements(password.text)
        var error = ""
        
        if username.text == "" || password.text == "" {           // || steht für oder!
        
            error = "Please enter a username and password"
        }
        
        else if lang < 8 {
            
            error = "Please choose a password with min. 8 characters"
        }
        
        
        
        if error != "" {
        
            displayAlert("Error in Form", error: error)
        
        
        } else {
        
            
            
                
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))               //Fortschrittsanzeige
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()                      //User kann nix mehr klicken

            
            if signUpActive == true {
                
                var user = PFUser()
                user.username = username.text             //Angepasst
                user.password = password.text             //Angepasst
            
                    user.signUpInBackgroundWithBlock {
                    (succeeded: Bool!, signupError: NSError!) -> Void in    // in signupError geändert, weil schon ein error existiert
                
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()                //User kann wieder klicken
                
                    if signupError == nil {
                        println("Signed Up")
                        
                    } else {
                            if let errorString = signupError.userInfo?["error"] as? NSString {
                        
                                error = errorString
                            } else {
                                "Please try again later"
                            }
                       
                    
                            self.displayAlert("Could not Sign Up", error: error)
                    
                    }
                }
        
            } else {
               
                PFUser.logInWithUsernameInBackground(username.text, password: password.text) {
                    (user: PFUser!, signupError: NSError!) -> Void in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()                //User kann wieder klicken
                    
                    if signupError == nil {
                        println("Logged In")
                        
                    
                    } else {
                        
                        if let errorString = signupError.userInfo?["error"] as? NSString {
                            
                            error = errorString
                        } else {
                            "Please try again later"
                        }
                        
                        
                        self.displayAlert("Could not Log In", error: error)

                        
                    }
                }
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
    
        
        
        
        
        
    
    }

    

}
















