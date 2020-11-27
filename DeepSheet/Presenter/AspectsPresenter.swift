//
//  AspectsPresenter.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 26/11/20.
//

import Foundation

class AspectsPresenter {
	
	weak private var aspectsViewDelegate: AspectsViewDelegate?
	
	//Remove once Presenter can store and get from Model
	var tempLuck: (current: Int, maximum: Int) = (0, 0)
	var tempMagic: (current: Int, maximum: Int) = (0, 0)
	var tempSanity: (current: Int, maximum: Int) = (0, 0)
	var tempHealth: (current: Int, maximum: Int) = (0, 0)
	
	init() {
		//Insert once Model is ready
		//let points = getPointsFromModel()
		let placeholderPoints = [
			(111, 111),
			(222, 222),
			(333, 333),
			(444, 444)
		]
		
		setPoints(with: placeholderPoints)
	}
	
	func setAspectsDelegate(viewDelegate: AspectsViewDelegate) {
		self.aspectsViewDelegate = viewDelegate
	}
	
	func getPoints() -> [(Int, Int)] {
		
		//Replace with getting data from Model
		let arrPoints = [
			tempLuck,
			tempMagic,
			tempSanity,
			tempHealth
		]
		
		return arrPoints
	}
	
	func setPoints(with arr: [(Int, Int)]) {
		
		//Insert formatting function to make sure input is numerical and valid
		
		//Replace with setting data into Model
		tempLuck = arr[0]
		tempMagic = arr[1]
		tempSanity = arr[2]
		tempHealth = arr[3]
	}
}
