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
    
    lazy var billDict: [String: Bill] = [String: Bill]()
    
    var name:String  {
        return self.firstName + " " + self.lastName
    }

    override init(id: String, firstName: String, lastName: String, gender: Gender,birthDate: Date?, userName: String, password: String, contact: Contact?, profileImageName: String?)
    {
        super.init(id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, userName: userName, password: password, contact: contact, profileImageName: profileImageName)
    }
    

}

extension Customer{
    
    var placeholderImageName: String{
        switch self.gender {
        case Gender.MALE:
            return "placeholderHeadshotMale.jpg"
        default:
            return "placeholderHeadshotFemale.jpg"
        }
    }
    
    func addBill(bill: Bill) {
        self.billDict.updateValue(bill, forKey: bill.id)
    }
    
    func getBills() -> [Bill]{
        return Array(self.billDict.values)
    }
    
    func getTotalBill() -> Float {
        var total: Float = 0.0
        for (_,bill) in self.billDict{
            total += bill.total
        }
        return total
    }
}
