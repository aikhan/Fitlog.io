//
//  ViewController.swift
//  FitLog.io
//
//  Created by Asad Khan on 01/10/2018.
//  Copyright © 2018 Robotika. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Sign In Button
        signInButton.backgroundColor = UIColor.green
        signInButton.layer.cornerRadius = 7.0
        signInButton.clipsToBounds = true
        
        //Email Address Text Field + Password Text Field Blur effect
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = emailAddressTextField.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            emailAddressTextField.backgroundColor = UIColor.clear
            emailAddressTextField.background = imageWithView(view: blurEffectView)
            passwordTextField.backgroundColor = UIColor.clear
            passwordTextField.background = imageWithView(view: blurEffectView)
            
        }
 
        //Placeholder text color Email Address + Passwprd Text Field.
        emailAddressTextField.attributedPlaceholder = NSAttributedString(string: "Email Address",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.gray])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                         attributes: [NSAttributedStringKey.foregroundColor: UIColor.gray])
        emailAddressTextField.layer.cornerRadius = 10.0
        emailAddressTextField.clipsToBounds = true
        emailAddressTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        emailAddressTextField.delegate = self
        emailAddressTextField.tag = 100
        passwordTextField.delegate = self
        passwordTextField.tag = 101
        
        
        
        
        facebookButton.layer.cornerRadius = 10.0
        facebookButton.clipsToBounds = true
        facebookButton.layer.borderColor = UIColor.white.cgColor
        facebookButton.layer.borderWidth = 2
        
        googleButton.layer.cornerRadius = 10.0
        googleButton.clipsToBounds = true
        googleButton.layer.borderColor = UIColor.white.cgColor
        googleButton.layer.borderWidth = 2
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageWithView(view:UIView)->UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
        os_log("Sign in button Tapped", type: .debug)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 100 {passwordTextField.becomeFirstResponder()}
        else {passwordTextField.resignFirstResponder()}
        // Do something here
        os_log("continue pressed", type: .debug)
        return true
    }
    
    @IBAction func facebookButtonTapped(_ sender: Any) {
        os_log("Facebook Button Tapped", type: .debug)
    }
    @IBAction func googleButtonTapped(_ sender: Any) {
        os_log("Google Button Tapped", type: .debug)
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        os_log("Create Account Tapped", type: .debug)
    }
    
}

