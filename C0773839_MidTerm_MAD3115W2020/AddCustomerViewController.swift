//
//  AddCustomerViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-06.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController {

    @IBOutlet weak var phoneNumberErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelBtnDown(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultConfigLoad()
    }
    
    func defaultConfigLoad() {
        let myColor : UIColor = UIColor.black
        self.emailTextField.layer.borderColor =  myColor.cgColor
        self.emailTextField.layer.borderWidth = 0.0
        self.emailErrorLabel.text = ""
        
        
        self.phoneNumberTextField.layer.borderColor =  myColor.cgColor
        self.phoneNumberTextField.layer.borderWidth = 0.0
        self.phoneNumberErrorLabel.text = ""


    }
    
    @IBAction func saveBtnDown(_ sender: Any) {
        
        self.defaultConfigLoad()
        
        // Add checks here
        let firstName = self.firstNameTextField.text!
        let lastName = self.secondNameTextField.text!
        
        
        // Create contact and handle errors
        let email = self.emailTextField.text!
        let phoneNumber = self.phoneNumberTextField.text!
        
        do{
            var contact = try Contact(mobileNumber: phoneNumber , emailId: email, address: nil)
        }
        catch EmailValidationError.isEmpty(let email){
            self.emailErrorLabel.text = "Email can't be Empty."
            let myColor : UIColor = UIColor.red
            self.emailTextField.layer.borderColor =  myColor.cgColor
            self.emailTextField.layer.borderWidth = 1.0
            return
        }
        catch EmailValidationError.isNotValidEmail(let email){
            self.emailErrorLabel.text = "Email is not Valid."
            let myColor : UIColor = UIColor.red
            self.emailTextField.layer.borderColor =  myColor.cgColor
            self.emailTextField.layer.borderWidth = 1.0
            return
        }
        catch EmailValidationError.isNotValidLength(let email){
            self.emailErrorLabel.text = "Email is of not valid length"
            let myColor : UIColor = UIColor.red
            self.emailTextField.layer.borderColor =  myColor.cgColor
            self.emailTextField.layer.borderWidth = 1.0
            return
        }
        catch PhoneNumberValidationError.voiletsMaxLength(let number){
            self.phoneNumberErrorLabel.text = "Phone number must be smaller than 17"
            let myColor : UIColor = UIColor.red
            self.phoneNumberTextField.layer.borderColor =  myColor.cgColor
            self.phoneNumberTextField.layer.borderWidth = 1.0
            return
        }
        catch PhoneNumberValidationError.voiletsMinLength(let number){
            self.phoneNumberErrorLabel.text = "Phone number must be longer than 6"
           let myColor : UIColor = UIColor.red
           self.phoneNumberTextField.layer.borderColor =  myColor.cgColor
           self.phoneNumberTextField.layer.borderWidth = 1.0
            return
        }
        catch{
            let alertController = UIAlertController(title: "Error", message:
                "Error in Email or PhoneNumber", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        
        var customer = Customer(id: ObjectManager.getInstance().getRandomID(), firstName: firstName, lastName: lastName, gender: Gender.MALE, birthDate: Date(), userName: "asdas", password: "asd", contact: nil)
        
        ObjectManager.getInstance().addCustomer(customer: customer)
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
