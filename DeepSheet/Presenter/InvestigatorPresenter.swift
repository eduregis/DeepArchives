//
//  InvestigatorPresenter.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 05/12/20.
//

import Foundation
import UIKit
class InvestigatorPresenter {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var investigators: [Investigator] = []
    
    func newInvestigator(_ name: String, _ occupation: String) {
        let newInvestigator = Investigator(context: self.context)
        newInvestigator.name = name
        newInvestigator.occupation = occupation
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
    func editInvestigator(_ name: String, _ occupation: String, _ investigator: Investigator) {
        let editInvestigator = investigator
        editInvestigator.name = name
        editInvestigator.occupation = occupation
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
    func fetchInvestigators() -> [Investigator] {
        do {
            self.investigators  = try context.fetch(Investigator.fetchRequest())
        } catch {
            fatalError("Unable to fetch data from core data ")
        }
        return self.investigators
    }
}
