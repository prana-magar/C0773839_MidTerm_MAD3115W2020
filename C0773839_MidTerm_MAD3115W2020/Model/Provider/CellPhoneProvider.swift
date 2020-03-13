//
//  CellPhoneProvider.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation
struct CellPhoneProvider {
    var name: String
    var baseRate: Float
    var gbUsedRate: Float
    var minuteUsedRate: Float
    
    func calculateTotalBill(gbUsed: Float, minuteUsed: Float) -> Float {
        return baseRate + (minuteUsed * self.minuteUsedRate) + (gbUsed * self.gbUsedRate)
    }
}
