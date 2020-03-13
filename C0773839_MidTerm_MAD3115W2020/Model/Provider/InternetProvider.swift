//
//  InternetProvider.swift
//  C0773839_MidTerm_MAD3115W2020
//
//  Created by Prakash on 2020-03-12.
//  Copyright © 2020 com.lambton. All rights reserved.
//

import Foundation

struct InternetProvider {
    var name: String
    var baseRate: Float
    var gbUsedRate: Float
    
    func calculateTotalBill(gbUsed: Float) -> Float {
        return baseRate + (gbUsed * self.gbUsedRate)
    }
}
