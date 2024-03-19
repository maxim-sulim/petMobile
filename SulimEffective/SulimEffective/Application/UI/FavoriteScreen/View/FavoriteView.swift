//
//  FavoriteView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

struct FavoriteView: View {
    
    @StateObject var viewModel: FavoriteViewModel
    @Binding var favoriteCount: Int
    
    var body: some View {
        FavoriteFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 6) {
                VStack(spacing: 30) {
                    HStack {
                        Text(viewModel.title)
                            .font(Font(UIFont.Style.title2.font))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    HStack {
                        Text(viewModel.subTitle)
                            .font(Font(UIFont.Style.text1.font))
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                }
                .padding(.horizontal, 10)
                Spacer(minLength: 10)
                ScrollView(.vertical) {
                    ForEach(viewModel.vacancyInputModel, id: \.id) { element in
                        VacancyView(isLike: element.islike,
                                    inputModel: element,
                                    delegate: viewModel,
                                    favoriteCount: $favoriteCount)
                        .padding(.horizontal, 10)
                    }
                }
                Spacer()
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .foregroundStyle(.gray)
                    .opacity(0.3)
            }
            .onAppear() {
                Task {
                    await viewModel.loadFavorite()
                }
            }
        }
    }
}
