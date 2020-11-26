//
//  AspectsPresenter.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 26/11/20.
//

import Foundation

class AspectsPresenter {
	
	weak private var aspectsViewDelegate: AspectsViewDelegate?
	
	func setAspectsDelegate(viewDelegate: AspectsViewDelegate) {
		self.aspectsViewDelegate = viewDelegate
	}
}
