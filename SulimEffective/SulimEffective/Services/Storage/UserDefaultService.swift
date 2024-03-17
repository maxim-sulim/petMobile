//
//  UserDefaultManager.swift
//  SulimEffective
//
//  Created by Максим Сулим on 16.03.2024.
//

import Foundation

enum UserDefaultKey: String {
    case tokenAuth
    case vacancy
}

protocol UserDefaultServiceProtocol: AnyObject {
    func get<T: Codable>(key: UserDefaultKey) -> T?
    func set<T: Codable>(object: T, key: UserDefaultKey)
}

final class UserDefaultService {
    private let storage = UserDefaults.standard
}

extension UserDefaultService: UserDefaultServiceProtocol {
    func get<T: Codable>(key: UserDefaultKey) -> T? {
        guard let data = try? storage.getObject(forKey: key.rawValue, castTo: T.self) else {
            return nil
        }
        return data
    }
    
    func set<T: Codable>(object: T, key: UserDefaultKey) {
        do {
            try storage.setObject(object, forKey: key.rawValue)
        } catch {
            return
        }
    }
}
