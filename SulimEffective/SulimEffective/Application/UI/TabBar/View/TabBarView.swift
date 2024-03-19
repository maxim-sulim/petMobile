//
//  TabBarView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel: TabBarViewModel
    @State private var selection = TabViewItemType.heart
    @State var isAuth: Bool
    @State var favoriteCount: Int
    
    var body: some View {
        content()
    }
    
    @ViewBuilder private func content() -> some View {
        TabView(selection: $selection) {
            SearchView(viewModel: SearchViewModel(), favoriteCount: $favoriteCount)
            .tabItem {
                TabViewItem(type: .search)
            }
            .tag(TabViewItemType.search)
            
            favorite()
            .tabItem {
                TabViewItem(type: .heart)
            }
            .tag(TabViewItemType.heart)
            .badge(favoriteCount)
            
            MockView()
            .tabItem {
                TabViewItem(type: .responses)
            }
            .tag(TabViewItemType.responses)
            
            MockView()
            .tabItem {
                TabViewItem(type: .message)
            }
            .tag(TabViewItemType.message)
            
            MockView()
            .tabItem {
                TabViewItem(type: .profile)
            }
            .tag(TabViewItemType.profile)
        }
    }
    
    @ViewBuilder private func favorite() -> some View {
        if isAuth {
            FavoriteView(viewModel: FavoriteViewModel(),
                         favoriteCount: $favoriteCount)
        } else {
            EntranceView(viewModel: EntranceViewModel(),
                         selection: $selection,
                         isAuth: $isAuth)
        }
    }
}
