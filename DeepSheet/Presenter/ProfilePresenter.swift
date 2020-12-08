//
//  ProfilePresenter.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 07/12/20.
//

import Foundation
import UIKit
import CoreData

class ProfilePresenter {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var profile: Profile?

    let investigator: Investigator

    init(_ investigator: Investigator) {
        self.investigator = investigator
        if (investigator.profile) == nil {
            newProfile()
        }
    }

    func newProfile() {
        let newProfile = Profile(context: self.context)
        newProfile.playerName = ""
        newProfile.age = ""
        newProfile.gender = ""
        newProfile.address = ""
        newProfile.birthPlace = ""
        newProfile.image = Data()
        newProfile.investigator = self.investigator

        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }

    func editProfile(_ playerName: String, _ age: String, _ gender: String, _ address: String, _ birthPlace: String, _ image: Data, _ profile: Profile) {
        let editProfile = profile
        editProfile.playerName = playerName
        editProfile.age = age
        editProfile.gender = gender
        editProfile.address = address
        editProfile.birthPlace = birthPlace
        editProfile.image = image
        
        do {
            try context.save()
        } catch {
            fatalError("Unable to save data in coredata model")
        }
    }

    func fetchProfile() -> Profile {
        let fetch = Profile.fetchRequest() as NSFetchRequest<Profile>
        let pred = NSPredicate(format: "investigator == %@", investigator)
        fetch.predicate = pred
        do {
            self.profile  = try context.fetch(fetch).first!
        } catch {
            fatalError("Unable to fetch data from core data ")
        }

        return self.profile!
    }
}
