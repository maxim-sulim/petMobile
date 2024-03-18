//
//  SearchFlowCoordinator.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import SwiftUI

class SearchFlowState: ObservableObject {
    @Published var presentedItem: SearchLink?
    @Published var path = NavigationPath()
}

struct SearchFlowCoordinator<Content: View>: View {

    @ObservedObject var state: SearchFlowState
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $state.path) {
            ZStack {
                content()
            }
            .navigationDestination(for: SearchLink.self, destination: linkDestination)
        }
    }

    @ViewBuilder private func linkDestination(link: SearchLink) -> some View {
        switch link {
        case let .edit(vacancy):
            editVacancyDestination(vacancy: vacancy)
        }
    }

    @ViewBuilder private func sheetContent(item: SearchLink) -> some View {
        EmptyView()
    }
    
    private func editVacancyDestination(vacancy: Vacancy) -> some View {
        let viewModel = EditVacancyViewModel(path: $state.path, vacancy: vacancy)
        let view = EditVacancyView(viewModel: viewModel, inputModel: viewModel.getInputModel())
        return view
    }
}
