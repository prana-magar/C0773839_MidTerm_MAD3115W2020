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
    private init(){
        
        // Create admin objects
        let admin1 = Admin(id: "1", userName: "rana_prakash", password: "hello")
        adminsObj.append(admin1)
        
        // Create customer objects
        var contact1 : Contact?
        
        do{
            contact1 = try Contact(mobileNumber: "(647)2339102", emailId: "johncena@invisible.com", address: nil)
        }
        catch{
            print("Couldnt create contact")
        }
        let cus1 = Customer(id: "1", firstName: "John", lastName: "Cena", gender: Gender.MALE, birthDate: Date(), userName: "johncen", password: "hello", contact: contact1, profileImageName: "hh.jpg")
        self.addCustomer(customer: cus1)
        
        var contact2:Contact?
        do{
            contact2 = try Contact(mobileNumber: "(647)23224444", emailId: "ram@gmail.com", address: nil)
        }
        catch {
            print("Couldnt create contact")
        }
        let cus2 = Customer(id: "2", firstName: "Ram", lastName: "Thapa", gender: Gender.MALE, birthDate: Date(), userName: "ramThapa", password: "err", contact: contact2, profileImageName: "headshot.jpg")
        self.addCustomer(customer: cus2)
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
