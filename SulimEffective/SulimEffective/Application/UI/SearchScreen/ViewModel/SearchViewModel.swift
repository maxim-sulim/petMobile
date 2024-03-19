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
    
    private func loadVacancy() async throws {
        let networkManager: NetworkManagerProtocol = NetworkManager()
        var model = try await networkManager.getDataSearch()
        try await fetchInputModel(model: &model)
    }
    
    private func fetchInputModel(model: inout Hanter) async throws {
        let formatVacancy: String = NSLocalizedString("more vacancy count", comment: "")
        let resultVacancy: String = String.localizedStringWithFormat(formatVacancy, model.vacancies.count)
        titleButton = "Еще \(resultVacancy)"
        
        model.vacancies.remove(atOffsets: IndexSet(3...model.vacancies.count - 1))
        model.vacancies.forEach({
            vacancyInputModel.append(VacancyInputModel(islike: checkLikeVaccancy(vacancy: $0),
                                                       looking: $0.lookingNumber,
                                                       countViewing: lookingString(looking: $0.lookingNumber ?? 0),
                                                       title: $0.title,
                                                       place: $0.address.town,
                                                       company: $0.company,
                                                       expirence: $0.experience.previewText,
                                                       publication: convertDateString($0.publishedDate),
                                                       object: $0))
        })
    }
    
    private func convertDateString(_ str: String) -> String {
        var component = str.components(separatedBy: "-")
        guard let numberDay = Int(component.saveObject(at: 2) ?? "") else { return "" }
        let newNumberDay = numberDay + 1
        component[2] = "\(newNumberDay)"
        let newStr = component.joined(separator: "-")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: newStr) else { return "" }
        dateFormatter.dateFormat = "MMMM"
        let result = dateFormatter.string(from: date)
        return "Опубликовано \(newNumberDay) \(result)"
    }
    
    private func lookingString(looking: Int) -> String {
        let formatHuman: String = NSLocalizedString("more human count", comment: "")
        let result = String.localizedStringWithFormat(formatHuman, looking)
        return "Сейчас просматривает \(result)"
    }
    
    private func checkLikeVaccancy(vacancy: Vacancy) -> Bool {
        guard let vacancyLike = storageManager.getVacancy() else {
            return false
        }
        return vacancyLike.contains(where: {$0.id == vacancy.id})
    }
    
    //MARK: - Public
    func likeVacancy(vakancy: Vacancy) async {
        storageManager.setVacancy(vakancy: vakancy)
    }
    
    func unlikeVacancy(vakancy: Vacancy) async {
        storageManager.removeVacancy(vakancy: vakancy)
    }
    
    func getTitleButton() -> String {
        titleButton
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
    
    func vacancyTapped(vacancy: Vacancy) {
        path.append(SearchLink.edit(vacancy))
    }
}
