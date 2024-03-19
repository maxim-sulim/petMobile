//
//  ContentViewModel.swift
//  SulimEffective
//
//  Created by Максим Сулим on 19.03.2024.
//

import Foundation
import UIKit

@MainActor
final class ContentViewModel: ContentFlowState {
    
    private let profileManager: ProfileManagerProtocol
    private let storageManager: StorageManagerProtocol
    
    override init() {
        self.profileManager = ProfileManager()
        self.storageManager = StorageManager()
    }
    
    //MARK: - Public
    
    func authToken() -> Bool {
        profileManager.authUser()
    }
    
    func favoriteCount() -> Int {
        guard authToken() else { return 0 }
        guard let vacancy = storageManager.getVacancy() else { return 0 }
        return vacancy.count
    }
    
    func setupTabView() {
        let standardAppearance = UITabBarAppearance()
        standardAppearance.configureWithDefaultBackground()
        standardAppearance.backgroundColor = .black
        UITabBar.appearance().standardAppearance = standardAppearance
        
        let scrollEdgeAppearance = UITabBarAppearance()
        scrollEdgeAppearance.backgroundColor = .black
        scrollEdgeAppearance.backgroundEffect = .none
        UITabBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
    }
}
