//
//  HistoricPresenter.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 07/12/20.
//

import Foundation
import UIKit
import CoreData

class HistoricPresenter {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var historic: Historic?
    
    let investigator: Investigator
    
    init(_ investigator: Investigator) {
        self.investigator = investigator
        if (investigator.historic) == nil {
            newHistoric()
        }
    }
    
    func newHistoric() {
        let newHistoric = Historic(context: self.context)
        newHistoric.personalDescription = ""
        newHistoric.ideology = ""
        newHistoric.traits = ""
        newHistoric.woundsAndScars = ""
        newHistoric.importantPersons = ""
        newHistoric.importantLocals = ""
        newHistoric.phobiasAndManias = ""
        newHistoric.possessions = ""
        newHistoric.meetingWithEntities = ""
        newHistoric.tomesAndSpells = ""
        newHistoric.investigator = self.investigator

        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
    func addHistoric () {
        
    }
    
    func editHistoric(_ personalDescription: String, _ ideology: String, _ traits: String, _ woundsAndScars: String, _ importantPersons: String, _ importantLocals: String,_ phobiasAndManias: String, _ possessions: String, _ meetingWithEntities: String, _ tomesAndSpells: String, _ historic: Historic) {
        let editHistoric = historic
        editHistoric.personalDescription = personalDescription
        editHistoric.ideology = ideology
        editHistoric.traits = traits
        editHistoric.woundsAndScars = woundsAndScars
        editHistoric.importantPersons = importantPersons
        editHistoric.importantLocals = importantLocals
        editHistoric.phobiasAndManias = phobiasAndManias
        editHistoric.possessions = possessions
        editHistoric.meetingWithEntities = meetingWithEntities
        editHistoric.tomesAndSpells = tomesAndSpells
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
    func fetchHistoric() -> Historic {
        let fetch = Historic.fetchRequest() as NSFetchRequest<Historic>
        let pred = NSPredicate(format: "investigator == %@", investigator)
        fetch.predicate = pred
        do {
            self.historic  = try context.fetch(fetch).first!
        } catch {
            fatalError("Unable to fetch data from core data ")
        }
        
        return self.historic!
    }
}
