//
//  Date+Extensions.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-04.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

extension Date{
    func printFormat(format: String = "EEEE, dd MMMM, yyyy") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_CA")
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func age() -> Int{
        let formattedDate = DateFormatter()
           formattedDate.dateFormat = "dd/MMM/yyyy"
           let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
           let now = Date()
           let calcAge = calendar.components(.year, from: self, to: now, options: [])
           let age = calcAge.year
           return age!
    }
}
