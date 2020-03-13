//
//  InternetBill.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
class InternetBill: Bill {
    var id: String
    var date: Date
    var type: BillType = BillType.Internet
    var provider: InternetProvider
    var usedGB: Float
    var total: Float {
        get {
            return self.provider.calculateTotalBill(
                gbUsed: self.usedGB
            )
        }
        
    }
    
    
    init(id: String, date: Date, provider: InternetProvider, usedGB: Float) {
        self.id = id
        self.date = date
        self.provider = provider
        self.usedGB = usedGB
    }
    

}
