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
    
    let investigator: Investigator
    
//    var aspect: Aspects
    
    init(_ investigator: Investigator) {
        self.investigator = investigator
        if investigator.aspectPoints == nil || investigator.aspectsStates == nil || investigator.aspectAttributes == nil {
            newAspects()
        }
    }
    
    
    func newAspects() {
        let points = AspectsPoints(context: context)
        
        points.currentHealth = Int64(0)
        points.currentLuck = Int64(0)
        points.currentSanity = Int64(0)
        points.currentMagic = Int64(0)

        points.totalHealth = Int64(0)
        points.totalLuck = Int64(0)
        points.totalSanity = Int64(0)
        points.totalMagic = Int64(0)
        
        let states = AspectsStates(context: context)
        
        states.gravelyWounded = false
        states.incapacitated = false
        states.indefinitelyInsane = false
        states.temporarilyInsane = false

        let attributes = AspectsAttributes(context: context)
        
        attributes.app = Int64(0)
        attributes.con = Int64(0)
        attributes.dex = Int64(0)
        attributes.edu = Int64(0)
        attributes.int = Int64(0)
        attributes.mov = Int64(0)
        attributes.pow = Int64(0)
        attributes.siz = Int64(0)
        attributes.str = Int64(0)
        
        points.investigator = self.investigator
        states.investigator = self.investigator
        attributes.investigator = self.investigator

        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
	// MARK: - Points Logic
	
    func getPoints() -> [(Int64, Int64)] {
        let aspectPoints = self.investigator.aspectPoints!
        let arrPoints = [
            (aspectPoints.currentLuck, aspectPoints.totalLuck),
            (aspectPoints.currentMagic, aspectPoints.totalMagic),
            (aspectPoints.currentSanity, aspectPoints.totalSanity),
            (aspectPoints.currentHealth, aspectPoints.totalHealth)
        ]

      return arrPoints
    }
    
	func setPoints(with arr: [(Int64, Int64)]) {
		
		//Insert formatting function to make sure input is numerical and valid
        let points = self.investigator.aspectPoints!
		//Replace with setting data into Model
        points.currentLuck = arr[0].0
        points.currentHealth = arr[3].0
        points.currentSanity = arr[2].0
        points.currentMagic = arr[1].0

        points.totalHealth = arr[3].1
        points.totalLuck = arr[0].1
        points.totalSanity = arr[2].1
        points.totalMagic = arr[1].1

        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
	}
    // MARK: - States Logic
    
    func getStates() -> [Bool] {
        let aspectStates = self.investigator.aspectsStates!
        let arrStates = [
            aspectStates.temporarilyInsane,
            aspectStates.indefinitelyInsane,
            aspectStates.incapacitated,
            aspectStates.gravelyWounded
        ]
        print(arrStates)
      return arrStates
    }
    
    func setStates(with arr: [Bool]) {
        //Insert formatting function to make sure input is numerical and valid
        let states = self.investigator.aspectsStates!
        //Replace with setting data into Model
        states.temporarilyInsane = arr[0]
        states.indefinitelyInsane = arr[1]
        states.incapacitated = arr[2]
        states.gravelyWounded = arr[3]
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
	// MARK: - Characteristics Logic
	func getCharacteristics() -> [Int64] {
        let attr = self.investigator.aspectAttributes!
        
        let tempStr = attr.str, tempDex = attr.dex, tempInt = attr.int
        let tempCon = attr.con,tempApp = attr.app, tempPow = attr.pow
        let tempSiz = attr.siz, tempEdu = attr.edu, tempMov = attr.mov

		let arrAttributess = [
			tempStr, tempDex, tempInt,
			tempCon, tempApp, tempPow,
			tempSiz, tempEdu, tempMov
		]
		
		return arrAttributess
	}
	
	func setCharacteristics(with arr: [Int64]) {
        let attr = self.investigator.aspectAttributes!
        
        attr.str = arr[0]
        attr.dex = arr[1]
        attr.int = arr[2]
        attr.con = arr[3]
        attr.app = arr[4]
        attr.pow = arr[5]
        attr.siz = arr[6]
        attr.edu = arr[7]
        attr.mov = arr[8]

        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }

	}
}
