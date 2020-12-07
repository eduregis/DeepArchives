//
//  SkillEnum.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 05/12/20.
//

import Foundation
class SkillEnum {
    
    let skillPresenter: SkillsPresenter
    
    init(_ presenter: SkillsPresenter) {
        self.skillPresenter = presenter
        skillPresenter.mockData("Accounting", 10)
        skillPresenter.mockData("Chemistry", 1)
        skillPresenter.mockData("Art", 5)
        skillPresenter.mockData("Astronomy", 1)
        skillPresenter.mockData("Anthropology", 1)
        skillPresenter.mockData("Bargain", 5)
        skillPresenter.mockData("Archaeology", 1)
        skillPresenter.mockData("Biology", 1)
        skillPresenter.mockData("Biology", 1)
        skillPresenter.mockData("Climb", 40)
        skillPresenter.mockData("Conceal", 15)
        skillPresenter.mockData("Craft", 5)
        skillPresenter.mockData("Credit Rating", 15)
        skillPresenter.mockData("Cthulhu Mythos", 1)
        skillPresenter.mockData("Disguise", 1)
        skillPresenter.mockData("Drive Automobile", 20)
        skillPresenter.mockData("Eletrical Repair", 10)
        skillPresenter.mockData("Fast Talk", 5)
        skillPresenter.mockData("First Aid", 30)
        skillPresenter.mockData("Fist/Punch", 50)
        skillPresenter.mockData("Geology", 1)
        skillPresenter.mockData("Grapple", 25)
        skillPresenter.mockData("Handgun", 20)
        skillPresenter.mockData("Head Butt", 10)
        skillPresenter.mockData("Hide", 10)
        skillPresenter.mockData("History", 20)
        skillPresenter.mockData("Jump", 25)
        skillPresenter.mockData("Kick", 25)
        skillPresenter.mockData("Law", 5)
        skillPresenter.mockData("Library Use", 25)
        skillPresenter.mockData("Listen", 25)
        skillPresenter.mockData("Locksmith", 1)
        skillPresenter.mockData("Machine Gun", 15)
        skillPresenter.mockData("Martial Arts", 1)
        skillPresenter.mockData("Mechanical Repair", 20)
        skillPresenter.mockData("Medicine", 5)
    }
}
