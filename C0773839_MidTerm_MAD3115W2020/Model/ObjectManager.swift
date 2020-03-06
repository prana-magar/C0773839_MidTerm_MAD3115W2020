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
        
        // Creating default objects
        
        // Admin 1
        var admin1 = Admin(id: "1", userName: "rana_prakash", password: "hello")
        adminsObj.append(admin1)
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
