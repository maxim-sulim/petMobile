//
//  CheckEmailViewModel.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation
import SwiftUI

struct CheckEmailViewInputModel {
    let title: String
    let message: String
    
    init(email: String) {
        self.title = "Отправили код на \(email)"
        self.message = "Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет"
    }
}

struct CheckEmailModel {
    let email: String
    var selection: Binding<TabViewItemType>
}

@MainActor
final class CheckEmailViewModel: CheckEmailFlowState {
    
    let inputModel: CheckEmailViewInputModel
    let profileManager: ProfileManagerProtocol
    
    init(path: Binding<NavigationPath>, email: String) {
        self.inputModel = CheckEmailViewInputModel(email: email)
        self.profileManager = ProfileManager()
        super.init(path: path)
    }
    
    
    func setCurrentUser() {
        profileManager.setCurrentAuth()
    }
}
