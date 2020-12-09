//
//  AspectsPresenter.swift
//  DeepSheet
//
//  Created by Pedro Henrique Costa on 26/11/20.
//

import Foundation
import UIKit
import CoreData

class AspectsPresenter {
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
	//Remove once Presenter can store and get from Model
	var tempLuck: (current: Int, maximum: Int) = (0, 0)
	var tempMagic: (current: Int, maximum: Int) = (0, 0)
	var tempSanity: (current: Int, maximum: Int) = (0, 0)
	var tempHealth: (current: Int, maximum: Int) = (0, 0)
	
	//Remove once Presenter can store and get from Model
	var tempStr: Int = 0
	var tempDex: Int = 0
	var tempInt: Int = 0
	
	var tempCon: Int = 0
	var tempApp: Int = 0
	var tempPow: Int = 0
	
	var tempSiz: Int = 0
	var tempEdu: Int = 0
	var tempMov: Int = 0
	
	init() {
		//Insert once Model is ready
		//let points = getPointsFromModel()
		let placeholderPoints = [
			(111, 111),
			(222, 222),
			(333, 333),
			(444, 444)
		]
		
		let placeholderCharacteristics = [
			11, 22, 33,
			44, 55, 66,
			77, 88, 99
		]
		
		setPoints(with: placeholderPoints)
		setCharacteristics(with: placeholderCharacteristics)
	}
	
	// MARK: - Points Logic
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
	
	// MARK: - Characteristics Logic
	func getCharacteristics() -> [Int] {
		
		let arrCharacteristics = [
			tempStr, tempDex, tempInt,
			tempCon, tempApp, tempPow,
			tempSiz, tempEdu, tempMov
		]
		
		return arrCharacteristics
	}
	
	func setCharacteristics(with arr: [Int]) {
		
		//Insert formatting function to make sure input is numerical and valid
		
		//Replace with setting data into Model
		tempStr = arr[0]
		tempDex = arr[1]
		tempInt = arr[2]
		
		tempCon = arr[3]
		tempApp = arr[4]
		tempPow = arr[5]
		
		tempSiz = arr[6]
		tempEdu = arr[7]
		tempMov = arr[8]
	}
}
