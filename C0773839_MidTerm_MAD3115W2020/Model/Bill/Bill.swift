//
//  Bill.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

enum BillType {
    case Hydro
    case Mobile
    case Internet
}


protocol Bill{
    var id: String {get set}
    var date: Date {get set}
    var type: BillType {get set}
    var total: Float{get}
    
}

extension Bill{
    func display(addTab:Bool = false) {
        let printstr = [
            "***************************************",
            "ID: \(self.id)",
            "Date: \(self.date.printFormat())",
            "Type: \(self.type)",
            "Total: \(self.total.priceFormat())",
            "***************************************"
        ]
        
        for str in printstr{
            if addTab{ print("\t", terminator:"")}
            print(str)
        }
    }
}
