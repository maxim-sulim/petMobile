//
//  EntranceFlowCoordinator.swift
//  SulimEffective
//
//  Created by Максим Сулим on 14.03.2024.
//

import SwiftUI

class EntranceFlowState: ObservableObject {
    @Published var presentedItem: EntranceLink?
    @Published var path = NavigationPath()
}

struct EntranceFlowCoordinator<Content: View>: View {

    @ObservedObject var state: EntranceFlowState
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $state.path) {
            ZStack {
                content()
            }
            .navigationDestination(for: EntranceLink.self, destination: linkDestination)
        }
    }

    @ViewBuilder private func linkDestination(link: EntranceLink) -> some View {
        switch link {
        case let .checkEmail(selected):
            checkEmailDestination(model: selected)
        }
    }

    @ViewBuilder private func sheetContent(item: EntranceLink) -> some View {
        EmptyView()
    }
    
    private func checkEmailDestination(model: CheckEmailModel) -> some View {
        let viewModel = CheckEmailViewModel(path: $state.path, email: model.email)
        let view = CheckEmailView(selection: model.selection, viewModel: viewModel)
        return view
    }
}


