//
//  StorageManager.swift
//  SulimEffective
//
//  Created by Максим Сулим on 16.03.2024.
//

import Foundation

protocol StorageManagerProtocol: AnyObject {
    func getVacancy() -> [Vacancy]?
    func setVacancy(vakancy: Vacancy)
    func removeVacancy(vakancy: Vacancy)
    func setAuthToken()
    func getAuthToken() -> String?
}


final class StorageManager {
    let storageService: UserDefaultServiceProtocol = UserDefaultService()
}

extension StorageManager: StorageManagerProtocol {
    func getVacancy() -> [Vacancy]? {
        guard let vakancy: [Vacancy] = storageService.get(key: .vacancy) else {
            return nil
        }
        return vakancy
    }
    
    func setVacancy(vakancy: Vacancy) {
        if var fromStorage: [Vacancy] = storageService.get(key: .vacancy) {
            fromStorage.append(vakancy)
            storageService.set(object: fromStorage, key: .vacancy)
            print("\(fromStorage)")
        } else {
            storageService.set(object: [vakancy], key: .vacancy)
            print("\(vakancy)")
        }
    }
    
    func removeVacancy(vakancy: Vacancy) {
        guard let fromStorage: [Vacancy] = storageService.get(key: .vacancy) else {
            return
        }
        let updateStorage = fromStorage.filter({ $0.id != vakancy.id })
        storageService.set(object: updateStorage, key: .vacancy)
    }
    
    func setAuthToken() {
        storageService.set(object: UUID().uuidString, key: .tokenAuth)
    }
    
    func getAuthToken() -> String? {
        storageService.get(key: .tokenAuth)
    }
}
