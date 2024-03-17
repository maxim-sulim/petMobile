//
//  FavoriteFlowCoordinator.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import SwiftUI

class FavoriteFlow: ObservableObject {
    @Published var presentedItem: FavoriteLink?
    @Published var path = NavigationPath()
}

struct FavoriteFlowCoordinator<Content: View>: View {

    @ObservedObject var state: FavoriteFlow
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $state.path) {
            ZStack {
                content()
            }
            .navigationDestination(for: FavoriteLink.self, destination: linkDestination)
        }
    }

    @ViewBuilder private func linkDestination(link: FavoriteLink) -> some View {
        switch link {
        case .link:
            EmptyView()
        }
    }

    @ViewBuilder private func sheetContent(item: FavoriteLink) -> some View {
        EmptyView()
    }
    
    
}
