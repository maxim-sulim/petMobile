//
//  ContentFlowCoordinator.swift
//  SulimEffective
//
//  Created by Максим Сулим on 19.03.2024.
//

import Foundation
import SwiftUI

open class ContentFlowState: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentedItem: ContentLink?
    @Published var coverItem: ContentLink?
}

struct ContentFlowCoordinator<Content: View>: View {

    @ObservedObject var state: ContentFlowState
    let content: () -> Content

    var body: some View {
        NavigationStack(path: $state.path) {
            ZStack {
                content()
                    .sheet(item: $state.presentedItem, content: sheetContent)
                    .fullScreenCover(item: $state.coverItem, content: coverContent)

            }
            .navigationDestination(for: ContentLink.self, destination: linkDestination)
        }
    }


    @ViewBuilder private func linkDestination(link: ContentLink) -> some View {
        switch link {
        case .link:
            EmptyView()
        }
    }

    @ViewBuilder private func sheetContent(item: ContentLink) -> some View {
       EmptyView()
    }

    @ViewBuilder private func coverContent(item: ContentLink) -> some View {
        EmptyView()
    }
}
