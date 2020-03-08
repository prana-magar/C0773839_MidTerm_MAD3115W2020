//
//  admin.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

class Admin: Person{
    init(id: String, firstName: String, lastName: String, gender: Gender,birthDate: Date?, userName: String, password: String, contact: Contact?) {
        super.init(id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, userName: userName, password: password, contact: contact, profileImageName: nil)
    }
    
    convenience init(id:String, userName:String, password:String){
        self.init(id: id, firstName: "default", lastName: "default", gender: Gender.MALE , birthDate: Date(), userName: userName, password: password, contact: nil)
    }
}

