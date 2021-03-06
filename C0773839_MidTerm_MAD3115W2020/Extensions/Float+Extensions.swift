//
//  Float+Extensions.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
extension Float{
    func priceFormat(locale: Locale =  Locale.current) -> String{
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        if let formattedPrice = formatter.string(from: self as NSNumber) {
            return formattedPrice
        }
        return ""
    }
    
    func distanceFormat() -> String{
        return "\(self) KM"
    }
}
