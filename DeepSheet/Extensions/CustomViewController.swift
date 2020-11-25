//
//  CustomViewController.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 25/11/20.
//

import UIKit

extension UIViewController {
	
	func hideKeyboardWhenTappedAround() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
}
