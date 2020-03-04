//
//  Address.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

/*Address class to manage the city,country,pin and
 street name for customer,owner and driver */
public class Address
{
    private var country: String
    private var city: String
    private var pincode: String
    private var streetName: String
    
    init(country: String, city: String, pincode: String, streetName: String)
    {
        self.country = country
        self.city = city
        self.pincode = pincode
        self.streetName = streetName
    }

}
