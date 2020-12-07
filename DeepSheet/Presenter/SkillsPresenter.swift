//
//  SkillsPresenter.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 04/12/20.
//

import Foundation
import UIKit
import CoreData

class SkillsPresenter {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var skills: [Skill] = []
    
    let investigator: Investigator
    
    init(_ investigator: Investigator) {
        self.investigator = investigator
        if (investigator.skills?.anyObject()) == nil {
            _ = SkillEnum.init(self)
        }
    }
    // MARK: - Business rules functions
    func checkIfSkillAlreadyExists(_ skillName: String) -> Bool {
        let pred = NSPredicate(format: "name == %@", skillName)
        let fetch = Skill.fetchRequest() as NSFetchRequest<Skill>
        fetch.predicate = pred
        do {
            let skill  = try context.fetch(fetch)
            if skill.isEmpty {
                return false
            }
        } catch {
            fatalError("Unable to fetch data from core data ")
        }
        return true
    }
    // MARK: - Core data functions
    
    func mockData(_ skillName: String, _ skillValue: Int64) {
        let newSkill = Skill(context: self.context)
        newSkill.name = skillName
        newSkill.value = skillValue
        newSkill.diceType = "d100"
        newSkill.isActivated = false
        newSkill.userCreated = false
        newSkill.investigator = self.investigator
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
    func newSkill(_ skillName: String, _ skillValue: Int64, _ switcher: Bool, _ desc: Int) -> Bool {
        if !BusinessRules.checkIfIsPercentageValue(skillValue) {
            return false
        }
        if checkIfSkillAlreadyExists(skillName) {
            return false
        }
        let newSkill = Skill(context: self.context)
        newSkill.name = skillName
        newSkill.value = skillValue
        newSkill.diceType = "d100"
        newSkill.isActivated = switcher
        newSkill.desc = Int64(desc)
        newSkill.userCreated = true
        newSkill.investigator = self.investigator
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
        return true

    }
    
    func editSkill(_ skillName: String, _ skillValue: Int64?, _ switcher: Bool, _ skill: Skill) -> Bool {
        if !BusinessRules.checkIfIsPercentageValue((skillValue != nil) ? skillValue! : skill.value) {
            return false
        }
        if skillName != skill.name && checkIfSkillAlreadyExists(skillName) {
            return false
        }
        let editSkill = skill
        editSkill.name = skill.name
        editSkill.value = skillValue!
        editSkill.diceType = "d100"
        editSkill.isActivated = switcher
        editSkill.userCreated = skill.userCreated
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
        return true
    }
    
    func fetchSkills() -> [Skill] {
        let fetch = Skill.fetchRequest() as NSFetchRequest<Skill>
        let pred = NSPredicate(format: "investigator == %@", investigator)
        let sortActivated = NSSortDescriptor(key: "isActivated", ascending: false)
        let sortName = NSSortDescriptor(key: "name", ascending: true)
        fetch.predicate = pred
        fetch.sortDescriptors = [sortActivated, sortName]
        do {
            self.skills  = try context.fetch(fetch)
        } catch {
            fatalError("Unable to fetch data from core data ")
        }
        return self.skills
    }
    
    func deleteSkill(_ skill: Skill) {
        if skill.userCreated {
            context.delete(skill)
            do {
                try context.save()
            } catch {
                fatalError("Unable to fetch data from core data ")
            }
        }
    }
}
