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
    private let storageManager: StorageManagerProtocol
    
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
    
    private func fetchInputModel(vacancyCount: Int) {
        let format : String = NSLocalizedString("more vacancy count", comment: "")
        let resultString: String = String.localizedStringWithFormat(format, vacancyCount)
        subTitle = resultString
    }
}
