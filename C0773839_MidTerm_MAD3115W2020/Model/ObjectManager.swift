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
        let cus1 = Customer(id: "1", firstName: "Prakash", lastName: "Rana", gender: Gender.MALE, birthDate: Date(), userName: "rana_prakash", password: "hello", contact: nil)
        self.addCustomer(customer: cus1)
        
        let cus2 = Customer(id: "2", firstName: "Ram", lastName: "Thapa", gender: Gender.MALE, birthDate: Date(), userName: "ramThapa", password: "err", contact: nil)
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

    
}
