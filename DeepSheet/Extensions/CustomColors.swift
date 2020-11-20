//
//  CustomColors.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 17/11/20.
//
import UIKit

extension UIColor {
    // MARK: - Color Hex Code Approach
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        if length == 6 {
            red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            alpha = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    // MARK: - Custom Colors
    static var goldenYellow: UIColor { return UIColor(hex: "#D9BB45")! }
    
    static var lightSeaGreen: UIColor { return UIColor(hex: "#00B884")! }
    
    static var ivory: UIColor { return UIColor(hex: "#F7FBEF")! }
    
    static var darkSeaGreen: UIColor { return UIColor(hex: "#204622")! }
    
    static var palePurple: UIColor { return UIColor(hex: "#665687")! }
    
    static var backgroundBlack: UIColor { return UIColor(hex: "#120309")! }
}
