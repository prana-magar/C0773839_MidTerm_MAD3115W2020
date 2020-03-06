//
//  Customer.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-05.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
class Customer : Person
{
    
//    var totalBill: Double  {
//        get{
//            var total: Double = 0
//            for (_,rent) in self.vehicleRents{
//                total += Double(rent.totalBill)
//
//            }
//            return total
//        }
//
//    }
    
    var name:String  {
        return self.firstName + self.lastName
    }

    override init(id: String, firstName: String, lastName: String, gender: Gender,birthDate: Date?, userName: String, password: String, contact: Contact?)
    {
        super.init(id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, userName: userName, password: password, contact: contact)
    }
    

}
