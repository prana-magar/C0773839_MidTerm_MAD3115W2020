//
//  Person.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//


import Foundation

public enum Gender
{
    case MALE,FEMALE,OTHER
    
    static func getGenderType(genderString: String) -> Gender{
        switch genderString.lowercased() {
        case "female":
            return Gender.FEMALE
        case "male":
            return Gender.MALE
        default:
            return Gender.OTHER
        }
    }
}




/* Person class containing necessary variables and functions to use*/

class Person
{
    func display(){
        print("Person")
    }
     var id: String
     var firstName: String
     var lastName: String
     var gender: Gender
     var birthDate: Date?
     var age: Int {get{ self.birthDate?.age() ?? 0 }}
     var userName: String
     var password: String
     var contact: Contact?
     var salt: String
    
    init(id: String, firstName: String, lastName: String, gender: Gender,birthDate: Date?, userName: String, password: String, contact: Contact?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.birthDate = birthDate
        self.userName = userName
        self.contact = contact
        self.salt = PasswordUtil.getSalt()
        self.password = PasswordUtil.getHashedPassword(plainPassword: password, salt: self.salt)
    }
    

    
    
}

