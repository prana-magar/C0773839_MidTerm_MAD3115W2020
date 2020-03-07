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
    private var address: Address


    
    internal init(mobileNumber: String, emailId: String, address: Address) throws
    {
        try Validations.email(email: emailId)
        try Validations.mobileNumber(number: mobileNumber)
        self.address = address
        self.emailId = emailId
        self.mobileNumber = mobileNumber
    }
        
}

