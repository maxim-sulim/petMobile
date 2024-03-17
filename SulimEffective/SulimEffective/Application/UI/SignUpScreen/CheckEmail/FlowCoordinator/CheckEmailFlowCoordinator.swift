//
//  CheckEmailFlowCoordinator.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation
import SwiftUI

class CheckEmailFlowState: ObservableObject {
    @Published var presentedItem: CheckEmailLink?
    @Binding var path: NavigationPath
    
    init(path: Binding<NavigationPath>) {
        _path = path
    }
}

struct CheckEmailFlowCoordinator<Content: View>: View {

    @ObservedObject var state: CheckEmailFlowState
    let content: () -> Content

    var body: some View {
        content()
            .sheet(item: $state.presentedItem, content: sheetContent)
            .navigationDestination(for: CheckEmailLink.self, destination: linkDestination)
    }

    @ViewBuilder private func linkDestination(link: CheckEmailLink) -> some View {
        EmptyView()
    }

    @ViewBuilder private func sheetContent(item: CheckEmailLink) -> some View {
        EmptyView()
    }
}
