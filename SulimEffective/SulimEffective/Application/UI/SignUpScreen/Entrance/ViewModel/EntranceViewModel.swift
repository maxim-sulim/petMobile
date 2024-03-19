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
    
    @Published var validError: Bool = false
    private var textFiled = ""
    
    func nextTapped(email: String, selected: Binding<TabViewItemType>, isAuth:Binding<Bool>) {
        if isValidEmail(email: email) {
            showCheckEmail(selected: selected, email: email, isAuth: isAuth)
        } else {
            validError = true
        }
    }
    
    func checkError(text: String) {
        if textFiled != text {
            validError = false
        }
        textFiled = text
    }
    
    private func showCheckEmail(selected: Binding<TabViewItemType>, email: String, isAuth: Binding<Bool>) {
        path.append(EntranceLink.checkEmail(CheckEmailModel(email: email, selection: selected, isAuth: isAuth)))
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
