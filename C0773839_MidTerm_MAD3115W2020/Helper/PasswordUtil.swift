//
//  PasswordUtil.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation


struct PasswordUtil {
    
    static var randomStr = "12344564576zxfdfsdfasdca"
    static func getSalt() -> String{
        return PasswordUtil.randomStr
    }
    
    static func getHashedPassword(plainPassword: String, salt: String) -> String{
        return plainPassword + salt
    }
    
    static func validate(plainPassword: String, salt: String, hashPassword: String) -> Bool{
        return getHashedPassword(plainPassword: plainPassword, salt: salt) ==  hashPassword
    }
    
}
