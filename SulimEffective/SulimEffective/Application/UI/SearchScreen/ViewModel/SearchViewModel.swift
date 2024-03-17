//
//  SearchViewModel.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation

@MainActor
final class SearchViewModel: SearchFlowState, Likebutton {
    @Published var vacancyInputModel: [VacancyInputModel] = []
    var titleButton = "Ищем вакансии"
    let storageManager: StorageManagerProtocol
    
    override init() {
        self.storageManager = StorageManager()
        super.init()
        Task {
            try? await loadVacancy()
        }
    }
    
    func likeVacancy(vakancy: Vacancy) async {
        storageManager.setVacancy(vakancy: vakancy)
    }
    
    func unlikeVacancy(vakancy: Vacancy) async {
        storageManager.removeVacancy(vakancy: vakancy)
    }
    func getTitleButton() -> String {
        titleButton
    }
    
    private func loadVacancy() async throws {
        let networkManager: NetworkManagerProtocol = NetworkManager()
        var model = try await networkManager.getDataSearch()
        try await fetchInputModel(model: &model)
    }
    
    private func fetchInputModel(model: inout Hanter) async throws {
        titleButton = "Еще \(model.vacancies.count) вакансий"
        model.vacancies.remove(atOffsets: IndexSet(3...model.vacancies.count - 1))
        model.vacancies.forEach({
            vacancyInputModel.append(VacancyInputModel(islike: checkLikeVaccancy(vacancy: $0),
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
    
    private func checkLikeVaccancy(vacancy: Vacancy) -> Bool {
        guard let vacancyLike = storageManager.getVacancy() else {
            return false
        }
        return vacancyLike.contains(where: {$0.id == vacancy.id})
    }
    
    func fethLikeVacancy() {
        vacancyInputModel = vacancyInputModel.map({
            VacancyInputModel(islike: checkLikeVaccancy(vacancy: $0.object),
                              looking: $0.looking,
                              countViewing: $0.countViewing,
                              title: $0.title,
                              place: $0.place,
                              company: $0.company,
                              expirence: $0.expirence,
                              publication: $0.publication,
                              object: $0.object)
        })
    }
}
