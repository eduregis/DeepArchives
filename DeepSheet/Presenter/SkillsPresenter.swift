//
//  SkillsPresenter.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 04/12/20.
//

import Foundation
import UIKit
class SkillsPresenter {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var skills: [Skill] = []
    
    func mockData(_ skillName: String, _ skillValue: Int64) {
        let newSkill = Skill(context: self.context)
        newSkill.name = skillName
        newSkill.value = skillValue
        newSkill.diceType = "d100"
        newSkill.isActivated = false
        newSkill.userCreated = false
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
    func newSkill(_ skillName: String, _ skillValue: Int64) {
        let newSkill = Skill(context: self.context)
        newSkill.name = skillName
        newSkill.value = skillValue
        newSkill.diceType = "d100"
        newSkill.isActivated = false
        newSkill.userCreated = true
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
    func fetchSkills() -> [Skill] {
        do {
            self.skills  = try context.fetch(Skill.fetchRequest())
        } catch {
            fatalError("Unable to fetch data from core data ")
        }
        return self.skills
    }
    
    func deleteSkill(_ skill: Skill) {
        context.delete(skill)
        do {
            try context.save()
        } catch {
            fatalError("Unable to fetch data from core data ")
        }
    }
}
