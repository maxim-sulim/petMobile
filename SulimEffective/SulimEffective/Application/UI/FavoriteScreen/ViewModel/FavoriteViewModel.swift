//
//  FavoriteViewModel.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI


@MainActor
final class FavoriteViewModel: FavoriteFlow, Likebutton {
    @Published var vacancyInputModel: [VacancyInputModel] = []
    var title = "Избранное"
    var subTitle = ""
    let storageManager: StorageManagerProtocol
    
    override init() {
        self.storageManager = StorageManager()
        super.init()
    }
    
    func likeVacancy(vakancy: Vacancy) async {
        storageManager.setVacancy(vakancy: vakancy)
    }
    
    func unlikeVacancy(vakancy: Vacancy) async {
        storageManager.removeVacancy(vakancy: vakancy)
        await loadFavorite()
    }
    
    func loadFavorite() async {
        guard var vacancy = storageManager.getVacancy() else {
            return
        }
        vacancyInputModel = []
        fetchInputModel(vacancyCount: vacancy.count)
        await getInputModel(vacancy: &vacancy)
    }
    
    private func getInputModel(vacancy: inout [Vacancy]) async {
        vacancy.forEach({
            vacancyInputModel.append(VacancyInputModel(islike: true,
                                                       looking: $0.lookingNumber,
                                                       countViewing: "Сейчас просматривает \($0.lookingNumber ?? 0) человек",
                                                       title: $0.title,
                                                       place: $0.address.town,
                                                       company: $0.company,
                                                       expirence: $0.experience.previewText,
                                                       publication: $0.publishedDate,
                                                       object: $0))
        })
    }
    
    private func fetchInputModel(vacancyCount: Int) {
        subTitle = "\(vacancyCount) вакансий"
    }
}
