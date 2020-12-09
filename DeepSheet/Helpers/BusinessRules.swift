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
    
    static func checkIfIsDicesIsValid(_ value: String) -> Bool {
        let values = value.split(separator: "+")
        
        for value in values {
            let str = (String(value).trimmingCharacters(in: .whitespacesAndNewlines).lowercased())
            let subValues = str.split(separator: "d")
            print(subValues)
            if subValues.count == 2 {
                if !isStringContainsOnlyNumbers(String(subValues[0])) || !isStringContainsOnlyNumbers(String(subValues[1])) {
                    return false
                }
            } else if subValues.count == 1 {
                if !isStringContainsOnlyNumbers(String(subValues[0])) {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
    
    static func isStringContainsOnlyNumbers( _ string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
