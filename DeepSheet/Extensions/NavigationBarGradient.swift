//
//  NavigationBarGradient.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 23/11/20.
//
import UIKit
extension UINavigationBar {

    func addGradient(_ toAlpha: CGFloat, _ color: UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [
            color.withAlphaComponent(toAlpha).cgColor,
            color.withAlphaComponent(0).cgColor
        ]
        gradient.locations = [0, 1]
        var frame = bounds
        frame.size.height += UIApplication.shared.statusBarFrame.size.height
        frame.origin.y -= UIApplication.shared.statusBarFrame.size.height
        gradient.frame = frame
        layer.insertSublayer(gradient, at: 1)
    }
    func setNavigationBarStyle() {
        self.largeTitleTextAttributes = [.foregroundColor: UIColor.ivory]
        self.prefersLargeTitles = true
        self.addGradient(1, UIColor.darkSeaGreen)
    }
}
