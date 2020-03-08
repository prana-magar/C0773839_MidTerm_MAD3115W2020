//
//  AddCustomerViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-06.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddCustomerViewController:UIViewController {
   
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var phoneNumberErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Gender Picker View
        
        var pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.genderTextField.inputView = pickerView
        
        
        // DOB code
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        dobTextField.inputView = datePicker
        
        datePicker.addTarget(self, action: #selector(AddCustomerViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(AddCustomerViewController.viewTapped(guestureRecognizer:)))
        view.addGestureRecognizer(tapGuesture)
        

        // Do any additional setup after loading the view.
    }
    
    
    
   
    
    @objc func viewTapped(guestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        self.dobTextField.text = datePicker.date.printFormat()
        //view.endEditing(true)
    }
    
    @IBAction func cancelBtnDown(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultConfigLoad()
    }
    
    func defaultConfigLoad() {
        
        self.emailTextField.animateToColor(selectedColor: UIColor.black)
        self.emailErrorLabel.text = ""
        
        
        self.phoneNumberTextField.animateToColor(selectedColor: UIColor.black)
        self.phoneNumberErrorLabel.text = ""
        
        self.firstNameTextField.animateToColor(selectedColor: UIColor.black)

        

    }
    
    
    @IBAction func saveBtnDown(_ sender: Any) {
        
        self.defaultConfigLoad()
        
        // Add checks here
        let firstName = self.firstNameTextField.text!
        
        if firstName.isEmpty {
            self.firstNameTextField.placeholder = "First Name cant be Empty"
            self.firstNameTextField.animateToColor(selectedColor: UIColor.red)
            return
        }
        let lastName = self.secondNameTextField.text!
        
        // Create contact and handle errors
        let email = self.emailTextField.text!
        let phoneNumber = self.phoneNumberTextField.text!
        
        var contact :Contact? = nil
        do{
            contact = try Contact(mobileNumber: phoneNumber , emailId: email, address: nil)
        }
        catch EmailValidationError.isEmpty(let email){
            self.emailErrorLabel.text = "Email can't be Empty."
            self.emailTextField.animateToColor(selectedColor: UIColor.red)
            return
        }
        catch EmailValidationError.isNotValidEmail(let email){
            self.emailErrorLabel.text = "Email is not Valid."
            self.emailTextField.animateToColor(selectedColor: UIColor.red)

            return
        }
        catch EmailValidationError.isNotValidLength(let email){
            self.emailErrorLabel.text = "Email is of not valid length"
            self.emailTextField.animateToColor(selectedColor: UIColor.red)
            return
        }
        catch PhoneNumberValidationError.voiletsMaxLength(let number){
            self.phoneNumberErrorLabel.text = "Phone number must be smaller than 17"
            self.phoneNumberTextField.animateToColor(selectedColor: UIColor.red)
            return
        }
        catch PhoneNumberValidationError.voiletsMinLength(let number){
            self.phoneNumberErrorLabel.text = "Phone number must be longer than 6"
           self.phoneNumberTextField.animateToColor(selectedColor: UIColor.red)
            return
        }
        catch{
            let alertController = UIAlertController(title: "Error", message:
                "Error in Email or PhoneNumber", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        
        var customer = Customer(id: ObjectManager.getInstance().getRandomID(), firstName: firstName, lastName: lastName, gender: Gender.MALE, birthDate: Date(), userName: "asdas", password: "asd", contact: contact)
        
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


extension AddCustomerViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
          }
          
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return Gender.allCases.count
      }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return "\(Gender.allCases[row])"
       }
          
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           self.genderTextField.text = "\(Gender.allCases[row])"
       }
}
