//
//  StringIsInt.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 09/12/20.
//

import Foundation

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
