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
    
    @IBOutlet weak var labelMinutesUsed: UITextField!
    @IBOutlet weak var labelUnitUsed: UITextField!
    @IBOutlet weak var labelProvider: UITextField!
    @IBOutlet weak var labelBillDate: UITextField!
    var customer: Customer?
//    var pickerViewData: [String] = [String]()
    var lastClicked: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defaultConfigLoad()
        var pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.labelBillType.inputView = pickerView
        self.labelProvider.inputView = pickerView
        
        
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
        
        if let billTypeText = self.labelBillType.text{
            
            if !billTypeText.isEmpty{
                       self.labelBillDate.animateVisibility(hidden: false)
                       self.labelProvider.animateVisibility(hidden: false)
                       switch BillType.getBillType(billString: billTypeText)  {
                           case .Hydro:
                              self.labelUnitUsed.animateVisibility(hidden: false)
                            self.labelMinutesUsed.animateVisibility(hidden: true)
                           case .Mobile:
                              self.labelUnitUsed.animateVisibility(hidden: false)
                              self.labelMinutesUsed.animateVisibility(hidden: false)

                           default:
                               self.labelUnitUsed.animateVisibility(hidden: false)
                                self.labelMinutesUsed.animateVisibility(hidden: true)

                       }
            
        }
       
            
        }
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
           self.labelBillDate.text = datePicker.date.printFormat(format: "MMMM/dd/yyyy")
           //view.endEditing(true)
       }
    
    func defaultConfigLoad() {
           
           self.labelBillType.animateToColor(selectedColor: UIColor.black)
           
           
           self.labelBillDate.animateToColor(selectedColor: UIColor.black)
           
        self.labelProvider.isHidden = true
        self.labelUnitUsed.isHidden = true
        self.labelMinutesUsed.isHidden = true
        self.labelBillDate.isHidden = true
           

       }
       

    
   
  
    @IBAction func textBillTypeDown(_ sender: UITextField) {
         self.lastClicked = sender
    }
    
    
    @IBAction func txtProviderDown(_ sender: UITextField) {
         self.lastClicked = sender
    }
    
   
    @IBAction func btnSaveDown(_ sender: Any) {
        
//        self.defaultConfigLoad()
               
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
                
            
            let providerName = self.labelProvider.text ?? ""
            if providerName.isEmpty {
                
                self.labelProvider.animateToColor(selectedColor: UIColor.red)
                return
            }
        
            let unitConsumed = self.labelUnitUsed.text ?? ""
            if unitConsumed.isEmpty {
                
                self.labelUnitUsed.animateToColor(selectedColor: UIColor.red)
                return
            }
            
           let unitConsumedVal = Float(unitConsumed) ?? 0.0
            
            
            
           
        
        
            // object creation
        
        
        var objManager = ObjectManager.getInstance()
        switch BillType.getBillType(billString: billType)   {
        case BillType.Hydro:
            var bill = HydroBill(id: objManager.getRandomID(),
            date: billDate,
            agency: objManager.getHydroProvider(name: providerName), unitConsumed: unitConsumedVal)
            objManager.hydroBillDict.updateValue(bill, forKey: bill.id)
            self.customer?.addBill(bill: bill)
        
        case BillType.Internet:
            var bill = InternetBill(id: objManager.getRandomID(), date: billDate, provider: objManager.getInternetProvider(name: providerName), usedGB: unitConsumedVal)
            objManager.internetBillDict.updateValue(bill, forKey: bill.id)
            self.customer?.addBill(bill: bill)

            
        default:
            let minConsumed = self.labelMinutesUsed.text ?? ""
            if minConsumed.isEmpty {
                
                self.labelMinutesUsed.animateToColor(selectedColor: UIColor.red)
                return
            }
            var minConsumedVal = Float(minConsumed) ?? 0.0
            var bill = MobileBill(id: objManager.getRandomID(), date: billDate, modelName: "aa", number: "123123123", usedGB: unitConsumedVal, usedMinutes: minConsumedVal, provider: objManager.getMobileProvider(name: providerName))
            objManager.mobileBillDict.updateValue(bill, forKey: bill.id)
            self.customer?.addBill(bill: bill)
            

        }
        
        self.navigationController?.popViewController(animated: true)
        
        
            
           
            
        
    }
}



extension AddBillViewController: UIPickerViewDelegate,  UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
              return 1
             }
             
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch self.lastClicked {
            
            case self.labelProvider:
                switch BillType.getBillType(billString: self.labelBillType.text!)  {
                    case .Hydro:
                        return ObjectManager.getInstance().hydroProvider.count
                    case .Mobile:
                        return ObjectManager.getInstance().mobileProvider.count
                    default:
                        return ObjectManager.getInstance().internetProvider.count
                }
            default:
                return BillType.allCases.count
            }
         
     }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
            switch self.lastClicked {
                
            case self.labelProvider:
                switch BillType.getBillType(billString: self.labelBillType.text!)  {
                    case .Hydro:
                        return ObjectManager.getInstance().hydroProvider[row].name
                    case .Mobile:
                        return ObjectManager.getInstance().mobileProvider[row].name
                    default:
                        return ObjectManager.getInstance().internetProvider[row].name
                }
            default:
                return "\(BillType.allCases[row])"
            }
      }
         
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch self.lastClicked {
            
        case self.labelProvider:
            switch BillType.getBillType(billString: self.labelBillType.text!)  {
                case .Hydro:
                    self.labelProvider.text = ObjectManager.getInstance().hydroProvider[row].name
                case .Mobile:
                    self.labelProvider.text =  ObjectManager.getInstance().mobileProvider[row].name
                default:
                    self.labelProvider.text =  ObjectManager.getInstance().internetProvider[row].name
            }
        default:
             self.labelBillType.text = "\(BillType.allCases[row])"
        
             
             
        }
        
         
      }
    
    
}
