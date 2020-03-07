//
//  ViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.textFieldUsername.text = ""
        self.textFieldPassword.text = ""
        if let usrName = UserDefaults.standard.string(forKey: "username"){
            if let passWord = UserDefaults.standard.string(forKey: "password"){
                self.textFieldUsername.text = usrName
                self.textFieldPassword.text = passWord
            }
        }
        
        self.defaultConf()
    }
    
    func defaultConf(){
        let myColor : UIColor = UIColor.black
        self.textFieldUsername.layer.borderColor =  myColor.cgColor
        self.textFieldUsername.layer.borderWidth = 0.0
        self.textFieldPassword.layer.borderColor =  myColor.cgColor
        self.textFieldPassword.layer.borderWidth = 0.0
        self.usernameErrorLabel.text  = ""
        self.passwordErrorLabel.text  = ""
    }
    
    func validateAdmin(username: String, password: String) -> Bool{
        var adminManager = ObjectManager.getInstance()
        for admin in adminManager.adminsObj{
            if username == admin.userName{
                return PasswordUtil.validate(plainPassword: password, salt: admin.salt, hashPassword: admin.password)
            }
        }
        return false
    }
    @IBAction func btnLogin(_ sender: Any) {
        self.defaultConf()
        print(self.textFieldUsername.text)
        guard let username = self.textFieldUsername.text  else{
            self.usernameErrorLabel.text  = "Username can't be empty"
            return
        }
        if username.isEmpty{
            let color = CABasicAnimation(keyPath: "borderColor")
            var myColor : UIColor = UIColor.white
            color.fromValue = myColor.cgColor
            
            myColor  = UIColor.red
            color.toValue = myColor.cgColor
            
            color.duration = 0.7
            color.repeatCount = 1

            self.usernameErrorLabel.text  = "Username can't be empty"
            self.textFieldUsername.layer.borderColor =  myColor.cgColor
            self.textFieldUsername.layer.borderWidth = 1.0
            self.textFieldUsername.layer.add(color, forKey: "borderColor")
            return
        }
        
        guard let password = self.textFieldPassword.text  else{
            self.passwordErrorLabel.text  = "Password can't be empty"
            return
        }
        
        if password.isEmpty{
            
            let color = CABasicAnimation(keyPath: "borderColor")
                       var myColor : UIColor = UIColor.white
                       color.fromValue = myColor.cgColor
                       
                       myColor  = UIColor.red
                       color.toValue = myColor.cgColor
                       
                       color.duration = 0.7
                       color.repeatCount = 1

           self.passwordErrorLabel.text  = "Username can't be empty"
           self.textFieldPassword.layer.borderColor =  myColor.cgColor
           self.textFieldPassword.layer.borderWidth = 1.0
           self.textFieldPassword.layer.add(color, forKey: "borderColor")
           return
            
        }
        if self.validateAdmin(username: username, password: password){
            if self.switchRememberMe.isOn{
                UserDefaults.standard.set(username, forKey: "username")
                UserDefaults.standard.set(password, forKey: "password")
            }
            else{
                UserDefaults.standard.removeObject(forKey: "username")
                UserDefaults.standard.removeObject(forKey: "password")

            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let customerListView = storyboard.instantiateViewController(identifier: "CustomerListViewController") as CustomerListViewController
            
            self.navigationController?.pushViewController(customerListView, animated: true)
        
        }
        else{
            //self.textViewError.text  = "Username or Password didn't match"
            let alertController = UIAlertController(title: "Error", message:
                "Username or Password didn't match", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    

}

