//
//  AddBillViewController.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-13.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import UIKit

class AddBillViewController: UIViewController {

    @IBOutlet weak var labelBillType: UITextField!
    
    @IBOutlet weak var labelBillAmount: UITextField!
    @IBOutlet weak var labelBillDate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.labelBillType.inputView = pickerView
        
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        labelBillDate.inputView = datePicker
        
        datePicker.addTarget(self, action: #selector(AddBillViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(AddBillViewController.viewTapped(guestureRecognizer:)))
        view.addGestureRecognizer(tapGuesture)

        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(guestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
           self.labelBillDate.text = datePicker.date.printFormat(format: "MMMM/dd/yyyy")
           //view.endEditing(true)
       }
    
    func defaultConfigLoad() {
           
           self.labelBillType.animateToColor(selectedColor: UIColor.black)
           
           
           self.labelBillDate.animateToColor(selectedColor: UIColor.black)
           
           self.labelBillAmount.animateToColor(selectedColor: UIColor.black)

           

       }
       
       
    
    @IBAction func btnSaveDown(_ sender: Any) {
        
        self.defaultConfigLoad()
               
               // Add checks here
               let billType = self.labelBillType.text!
               
               if billType.isEmpty {
                   
                   self.labelBillType.animateToColor(selectedColor: UIColor.red)
                   return
               }
        
            let billDateString = self.labelBillDate.text ?? ""
            if billDateString.isEmpty {
                
                self.labelBillDate.animateToColor(selectedColor: UIColor.red)
                return
            }
            let billDate = Date.ofStr(dateString: billDateString) ?? Date()
                
            let billAmount = self.labelBillAmount.text ?? ""
            if billAmount.isEmpty {
                
                self.labelBillAmount.animateToColor(selectedColor: UIColor.red)
                return
            }
        
        
            // object creation
           
            
        
    }
}



extension AddBillViewController: UIPickerViewDelegate,  UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
              return 1
             }
             
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return BillType.allCases.count
     }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return "\(BillType.allCases[row])"
      }
         
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          self.labelBillType.text = "\(BillType.allCases[row])"
      }
    
    
}
