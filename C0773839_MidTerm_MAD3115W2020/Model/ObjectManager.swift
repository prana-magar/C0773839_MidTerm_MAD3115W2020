//
//  objectManager.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

class ObjectManager {
    
    static private var obj = ObjectManager()
    
    lazy var adminsObj: [Admin] = [Admin]()
    private var customerObjDict :[String: Customer]?
    lazy var mobileBillDict: [String: MobileBill] = [String: MobileBill]()
    lazy var hydroBillDict: [String: HydroBill] = [String: HydroBill]()
    lazy var internetBillDict: [String: InternetBill] = [String: InternetBill]()

    private init(){
        
        // Create admin objects
        let admin1 = Admin(id: "1", userName: "rana_prakash", password: "hello")
        adminsObj.append(admin1)
        
        self.loadObjects()
    }
    
    static func getInstance() -> ObjectManager{
        return ObjectManager.obj
    }
    
    func addCustomer(customer: Customer)  {
        let id = customer.id
        if let customerDict = self.customerObjDict{
            self.customerObjDict?.updateValue(customer, forKey: id)
        }
        else{
            self.customerObjDict = [String: Customer]()
            self.customerObjDict?.updateValue(customer, forKey: id)
        }
        
    }
    
    func getCustomerList() -> [Customer]{
        if let customerDict = self.customerObjDict{
            return Array(customerDict.values)
        }
        return []
    }
    
    func getRandomID() -> String{
       func randomString(len:Int) -> String {
            let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let c = Array(charSet)
            var s:String = ""
            for _ in (1...10) {
                s.append(c[Int(arc4random()) % c.count])
            }
            return s
        }
        return randomString(len: 8)
    }

    
}


extension ObjectManager {
    
    
    func loadObjects(){
        var fidoPhoneProvider = CellPhoneProvider(name: "FIDO",
                                     baseRate: 10,
                                     gbUsedRate: 5.0,
                                     minuteUsedRate: 2)

        var publicMobilePhoneProvider = CellPhoneProvider(name: "Public Mobile",
                                                            baseRate: 7,
                                                            gbUsedRate:4.0,
                                                            minuteUsedRate: 1.5)

        var freedomMobilePhoneProvider = CellPhoneProvider(name: "Freedom",
                                                               baseRate: 8,
                                                               gbUsedRate:7.0,
                                                               minuteUsedRate: 4.5)
        // All InternetProviders
        var bellInternetProvider = InternetProvider(name: "Bell",
                                                    baseRate: 10,
                                                    gbUsedRate: 0.5)

        var rogersInternetProvider = InternetProvider(name: "Rogers",
                                                    baseRate: 7,
                                                    gbUsedRate: 0.9)

        // All HydroProviders
        var justEnergyHydroProvider = HydroProvider(name: "Just Energy",
                                                    baseRate: 5,
                                                    unitRate: 5.5)

        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 7
        dateComponents.day = 11

        // Create date from components
        let userCalendar = Calendar.current
        let date1 = userCalendar.date(from: dateComponents)
        var mobileBill1 = MobileBill(id: "fido_1",
                                     date: date1!,
                                     modelName: "Samsung s9",
                                     number: "289456789",
                                     usedGB: 4.6,
                                     usedMinutes: 35.4,
                                     provider: fidoPhoneProvider)
        self.mobileBillDict.updateValue(mobileBill1, forKey: mobileBill1.id)

        // Hydro bill 1
        var hydroBill1 = HydroBill(id: "justenergy_1",
                                   date: date1!.addingTimeInterval(1231232312),
                                   agency: justEnergyHydroProvider,
                                   unitConsumed: 45.3)
        self.hydroBillDict.updateValue(hydroBill1, forKey: hydroBill1.id)

        
        // Create customer objects
        var contact1 : Contact?
        
        do{
            contact1 = try Contact(mobileNumber: "(647)2339102", emailId: "johncena@invisible.com", address: nil)
        }
        catch{
            print("Couldnt create contact")
        }
        let cus1 = Customer(id: "1", firstName: "John", lastName: "Cena", gender: Gender.MALE, birthDate: Date(), userName: "johncen", password: "hello", contact: contact1, profileImageName: "hh.jpg")
        cus1.addBill(bill: mobileBill1)
        cus1.addBill(bill: hydroBill1)
        self.addCustomer(customer: cus1)
        
        
        
        
        // customer 2
        
        var mobileBill2 = MobileBill(id: "publicMobile_1",
                                     date: Date(),
                                     modelName: "iphone X",
                                     number: "289445678",
                                     usedGB: 5.9,
                                     usedMinutes: 55.3,
                                     provider: publicMobilePhoneProvider)
        self.mobileBillDict.updateValue(mobileBill2, forKey: mobileBill2.id)
    

        var internetBill2 = InternetBill(id: "bell_1",
                                         date: Date(),
                                         provider: bellInternetProvider,
                                         usedGB: 67.8)
        self.internetBillDict.updateValue(internetBill2, forKey: internetBill2.id)


        var hydroBill2 = HydroBill(id: "justenergy_2",
                                   date: Date(),
                                   agency: justEnergyHydroProvider,
                                   unitConsumed: 55.3)
        self.hydroBillDict.updateValue(hydroBill2, forKey: hydroBill2.id)

        
        
        var contact2:Contact?
        do{
            contact2 = try Contact(mobileNumber: "(647)23224444", emailId: "ram@gmail.com", address: nil)
        }
        catch {
            print("Couldnt create contact")
        }
        let cus2 = Customer(id: "2", firstName: "Ram", lastName: "Thapa", gender: Gender.MALE, birthDate: Date(), userName: "ramThapa", password: "err", contact: contact2, profileImageName: "headshot.jpg")
        cus2.addBill(bill: mobileBill2)
        cus2.addBill(bill: internetBill2)
        cus2.addBill(bill: hydroBill2)

        self.addCustomer(customer: cus2)
    }
}
