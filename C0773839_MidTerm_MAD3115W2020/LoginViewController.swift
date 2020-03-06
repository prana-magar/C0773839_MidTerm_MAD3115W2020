//
//  ViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var switchRememberMe: UISwitch!
    @IBOutlet weak var textViewError: UITextView!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let usrName = UserDefaults.standard.string(forKey: "username"){
            if let passWord = UserDefaults.standard.string(forKey: "password"){
                self.textFieldUsername.text = usrName
                self.textFieldPassword.text = passWord
            }
        }
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
        print(self.textFieldUsername.text)
        guard let username = self.textFieldUsername.text  else{
            self.textViewError.text  = "Username can't be empty"
            return
        }
        if username.isEmpty{
            self.textViewError.text  = "Username can't be empty"
            return
        }
        
        guard let password = self.textFieldPassword.text  else{
            self.textViewError.text  = "Password can't be empty"
            return
        }
        
        if password.isEmpty{
            self.textViewError.text  = "Password can't be empty"
            return
        }
        if self.validateAdmin(username: username, password: password){
            self.textViewError.text  = "Success"
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
            self.textViewError.text  = "Username or Password didn't match"
        }
        
    }
    

}

