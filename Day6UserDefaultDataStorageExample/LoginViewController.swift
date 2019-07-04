//
//  ViewController.swift
//  Day6UserDefaultDataStorageExample
//
//  Created by Neeraj Prasher on 2019-07-04.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmailID: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnSignIN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = UserDefaults.standard
        
        //if value is there then show it
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            print(email)
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if self.txtEmailID.text == "admin@gmail.com" && self.txtPassword.text == "admin123"
        {
            
        }else{
            let alert = UIAlertController(title: "Invalid Credentials", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(actionOk)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func switchRememberMe(_ sender: UISwitch) {
        if sender.isOn{
           // save details
            let userDefault = UserDefaults.standard
            userDefault.setValue(txtEmailID.text, forKey: "userEmail")
            userDefault.setValue(txtPassword.text, forKey: "userPassword")
        }else{
            // remove details
            let userDefault = UserDefaults.standard
            userDefault.setValue(nil, forKey: "userEmail")
            userDefault.setValue(nil, forKey: "userPassword")

        }
    }
    
    @IBAction func unWindLogutFromAnyScreen(storyboard: UIStoryboardSegue)
    {
        print("Logout")
        let s = storyboard.source as! WelcomeViewController
        print(s.lblWelcome.text!)
    }

}

