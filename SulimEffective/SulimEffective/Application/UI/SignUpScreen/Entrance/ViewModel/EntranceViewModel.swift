//
//  EntranceViewModel.swift
//  SulimEffective
//
//  Created by Максим Сулим on 14.03.2024.
//

import Foundation
import SwiftUI

@MainActor
final class EntranceViewModel: EntranceFlowState {
    
    
    func nextTapped(email: String, selected: Binding<TabViewItemType>) {
        if isValidEmail(email: email) {
            showCheckEmail(selected: selected, email: email)
        } else {
            print("false valid")
        }
    }
    
    private func showCheckEmail(selected: Binding<TabViewItemType>, email: String) {
        path.append(EntranceLink.checkEmail(CheckEmailModel(email: email, selection: selected)))
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
