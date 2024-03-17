//
//  ProfileManager.swift
//  SulimEffective
//
//  Created by Максим Сулим on 14.03.2024.
//

import Foundation

protocol ProfileManagerProtocol {
    func authUser() -> Bool
    func setCurrentAuth()
}

final class ProfileManager {
    let storageManager: StorageManagerProtocol = StorageManager()
    
}

extension ProfileManager: ProfileManagerProtocol {    
    func authUser() -> Bool {
        guard (storageManager.getAuthToken()) != nil else {
            return false
        }
        return true
    }
    
    func setCurrentAuth() {
        storageManager.setAuthToken()
    }
}
