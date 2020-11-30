//
//  SearchBar.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 27/11/20.
//

import UIKit

extension UISearchBar {
    
    public var textField: UITextField? {
        if #available(iOS 13, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap {$0.subviews}
        guard let textField = (subViews.filter {$0 is UITextField}).first as? UITextField else { return nil }
        return textField
    }
    
    func changePlaceholderColor(_ color : UIColor){
        guard let UISearchBarTextFieldLabel: AnyClass = NSClassFromString("UISearchBarTextFieldLabel"),
              let field = textField else { return  }
        for subview in field.subviews where subview.isKind(of: UISearchBarTextFieldLabel) {
            (subview as! UILabel).textColor = color
        }
    }
    
}
