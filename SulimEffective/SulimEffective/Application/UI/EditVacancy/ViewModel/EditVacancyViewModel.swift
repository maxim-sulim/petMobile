//
//  EditVacancyViewModel.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

@MainActor
final class EditVacancyViewModel: EditVacancyFlowState {
    
    let vacancy: Vacancy
    let storageManager: StorageManagerProtocol
    
    init(path: Binding<NavigationPath>, vacancy: Vacancy) {
        self.storageManager = StorageManager()
        self.vacancy = vacancy
        super.init(path: path)
    }
    
    func checkLikeVaccancy() -> Bool {
        guard let vacancyLike = storageManager.getVacancy() else {
            return false
        }
        return vacancyLike.contains(where: {$0.id == vacancy.id})
    }
    
    func popScene() {
        path.removeLast()
    }
    
    func getInputModel() -> EditVacancyInputModel {
        EditVacancyInputModel(title: vacancy.title,
                              salary: vacancy.salary.full,
                              experience: vacancy.experience.text,
                              schedules: vacancy.schedules.reduce("", {$0 + $1}),
                              applied: vacancy.appliedNumber != nil ?
                              "\(humanString(looking: vacancy.appliedNumber ?? 0)) человек уже откликнулось" : nil,
                              looking: vacancy.lookingNumber != nil ?
                              "\(humanString(looking: vacancy.lookingNumber ?? 0)) человека сейчас смотрят" : nil,
                              company: vacancy.company,
                              address: "\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)",
                              description: vacancy.description != nil ? "\(vacancy.description ?? "")" : nil,
                              responsibilities: vacancy.responsibilities,
                              questions: vacancy.questions)
    }
    
    private func humanString(looking: Int) -> String {
        let formatHuman: String = NSLocalizedString("more human count", comment: "")
        return String.localizedStringWithFormat(formatHuman, looking)
    }
}
