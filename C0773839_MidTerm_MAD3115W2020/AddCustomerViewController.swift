//
//  AddCustomerViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-06.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController {

    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelBtnDown(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func saveBtnDown(_ sender: Any) {
        
        // SAve
        
        // Add checks here
        let firstName = self.firstNameTextField.text!
        let lastName = self.secondNameTextField.text!
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
