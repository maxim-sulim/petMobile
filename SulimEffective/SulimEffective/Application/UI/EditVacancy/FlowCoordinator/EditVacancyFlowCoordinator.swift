//
//  EditVacancyFlowCoordinator.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

class EditVacancyFlowState: ObservableObject {
    @Published var presentedItem: EditVacancyLink?
    @Binding var path: NavigationPath
    
    init(path: Binding<NavigationPath>) {
        _path = path
    }
}

struct EditVacancyFlowCoordinator<Content: View>: View {

    @ObservedObject var state: EditVacancyFlowState
    let content: () -> Content

    var body: some View {
        content()
            .sheet(item: $state.presentedItem, content: sheetContent)
            .navigationDestination(for: EditVacancyLink.self, destination: linkDestination)
    }

    @ViewBuilder private func linkDestination(link: EditVacancyLink) -> some View {
        EmptyView()
    }

    @ViewBuilder private func sheetContent(item: EditVacancyLink) -> some View {
        EmptyView()
    }
}
