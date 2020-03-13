//
//  HydroBill.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation


class HydroBill: Bill {
    var id: String
    var date: Date
    var type: BillType = BillType.Hydro
    var total: Float {
        get {
            return self.agency.calculateTotalBill(
                unitConsumed: self.unitConsumed)
        }
    }
    var agency: HydroProvider
    var unitConsumed: Float
    
    init(id: String, date: Date, agency: HydroProvider, unitConsumed: Float) {
        self.id = id
        self.date = date
        self.agency = agency
        self.unitConsumed = unitConsumed
    }
    
    
}
