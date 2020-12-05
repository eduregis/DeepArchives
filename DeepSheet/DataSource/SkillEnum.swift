//
//  SkillEnum.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 05/12/20.
//

import Foundation
class SkillEnum {
    
    let skillPresenter = SkillsPresenter()
    
    init() {
        skillPresenter.mockData("Accounting", 10)
        skillPresenter.mockData("Anthropology", 1)
        skillPresenter.mockData("Archaeology", 1)
        skillPresenter.mockData("Art", 5)
        skillPresenter.mockData("Astronomy", 1)
        skillPresenter.mockData("Bargain", 5)
        skillPresenter.mockData("Biology", 1)
        skillPresenter.mockData("Chemistry", 1)
    }
}
