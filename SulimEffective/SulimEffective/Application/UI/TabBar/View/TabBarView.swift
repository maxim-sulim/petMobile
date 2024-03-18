//
//  TabBarView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    
    @StateObject var viewModel = TabBarViewModel()
    @State private var selection = TabViewItemType.heart
    
    var body: some View {
        content()
    }
    
    @ViewBuilder private func content() -> some View {
        TabView(selection: $selection) {
            SearchView(viewModel: SearchViewModel())
            .tabItem {
                TabViewItem(type: .search)
            }
            .tag(TabViewItemType.search)
            
            favorite()
            .tabItem {
                TabViewItem(type: .heart)
            }
            .tag(TabViewItemType.heart)
            
            ZStack {
                Color.black
            }
            .tabItem {
                TabViewItem(type: .responses)
            }
            .tag(TabViewItemType.responses)
            
            ZStack {
                Color.black
            }
            .tabItem {
                TabViewItem(type: .message)
            }
            .tag(TabViewItemType.message)
            
            ZStack {
                Color.black
            }
            .tabItem {
                TabViewItem(type: .profile)
            }
            .tag(TabViewItemType.profile)
        }
    }
    
    @ViewBuilder private func favorite() -> some View {
        if !viewModel.authToken() {
            FavoriteView(viewModel: FavoriteViewModel())
        } else {
            EntranceView(viewModel: EntranceViewModel(), selection: $selection)
        }
    }
}
