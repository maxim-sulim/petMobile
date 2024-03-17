//
//  TabBarViewModel.swift
//  SulimEffective
//
//  Created by Максим Сулим on 14.03.2024.
//

import Foundation
import SwiftUI

@MainActor
final class TabBarViewModel: ObservableObject {
    
    let profileManager: ProfileManagerProtocol = ProfileManager()
    
    func authToken() -> Bool {
        profileManager.authUser()
    }
}

