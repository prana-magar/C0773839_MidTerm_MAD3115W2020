//
//  Contact.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation


/* Contact class to manage the mobilenumber, email and address of customers, owners , drivers */

public class Contact
{
    private var mobileNumber: String
    private var emailId: String
    private var addressObj: Address?

    var email:  String {
        return emailId
    }
    var number: String{
        return mobileNumber
    }
    
    
    internal init(mobileNumber: String, emailId: String, address: Address?) throws
    {
        try Validations.email(email: emailId)
        try Validations.mobileNumber(number: mobileNumber)
        self.addressObj = address
        self.emailId = emailId
        self.mobileNumber = mobileNumber
    }
    
    
        
}

