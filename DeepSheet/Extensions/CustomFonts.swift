//
//  CustomFonts.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 23/11/20.
//

import UIKit

extension UIFont {
    class func josefinSansBold() -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Bold", size: 24) else {
            fatalError("""
               Failed to load the "JosefinSans-Bold" font.
               Make sure the font file is included in the project and the font name is spelled correctly.
               """
           )
        }
        return font
    }
    
    class func josefinSansRegular() -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Regular", size: 20) else {
            fatalError("""
               Failed to load the "JosefinSans-Regular" font.
               Make sure the font file is included in the project and the font name is spelled correctly.
               """
           )
        }
        return font
    }
    
    class func josefinSansResult() -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Bold", size: 70) else {
            fatalError("""
               Failed to load the "JosefinSans-Bold" font.
               Make sure the font file is included in the project and the font name is spelled correctly.
               """
           )
        }
        return font
    }
    
    class func josefinSansDetail() -> UIFont {
        guard let font = UIFont(name: "JosefinSans-Regular", size: 14) else {
            fatalError("""
               Failed to load the "JosefinSans-Regular" font.
               Make sure the font file is included in the project and the font name is spelled correctly.
               """
           )
        }
        return font
    }
}
