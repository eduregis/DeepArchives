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
    
    func newSkill(_ skillName: String, _ skillValue: Int64, _ switcher: Bool, _ desc: Int) {
        let newSkill = Skill(context: self.context)
        newSkill.name = skillName
        newSkill.value = skillValue
        newSkill.diceType = "d100"
        newSkill.isActivated = switcher
        newSkill.desc = Int64(desc)
        newSkill.userCreated = true
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
    func editSkill(_ skillName: String, _ skillValue: Int64?, _ switcher: Bool, _ skill: Skill) {
        let editSkill = skill
        editSkill.name = skill.name
        editSkill.value = (skillValue != nil) ? skillValue! : skill.value
        editSkill.diceType = "d100"
        editSkill.isActivated = switcher
        editSkill.userCreated = skill.userCreated
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }
    
    func fetchSkills() -> [Skill] {
        let fetch = Skill.fetchRequest() as NSFetchRequest<Skill>
        //let pred = NSPredicate(format: "isActivated == %@", NSNumber(value: true))
        let sortActivated = NSSortDescriptor(key: "isActivated", ascending: false)
        let sortName = NSSortDescriptor(key: "name", ascending: true)

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
