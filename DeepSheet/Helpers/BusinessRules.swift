//
//  BusinessRules.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 07/12/20.
//

import Foundation
class BusinessRules {
    static func checkIfIsPercentageValue(_ value: Int64) -> Bool {
        if value >= 0 && value < 100 {
            return true
        }
        return false
    }
}
