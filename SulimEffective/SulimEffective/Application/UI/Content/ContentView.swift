//
//  ContentView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 14.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
       ContentFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        TabBarView(viewModel: TabBarViewModel(),
                   isAuth: viewModel.authToken(),
                   favoriteCount: viewModel.favoriteCount())
        .onAppear() {
            viewModel.setupTabView()
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}

