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
    
    var body: some View {
        FavoriteFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    VStack(spacing: 30) {
                        HStack {
                            Text(viewModel.title)
                                .font(.title2)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        HStack {
                            Text(viewModel.subTitle)
                                .font(.title3)
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                    }
                    Spacer(minLength: 10)
                    ForEach(viewModel.vacancyInputModel, id: \.id) { element in
                        VacancyView(isLike: element.islike,
                                    inputModel: element,
                                    delegate: viewModel)
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                    }
                    Spacer()
                }
                .onAppear() {
                    Task {
                        await viewModel.loadFavorite()
                    }
                }
            }
        }
    }
}
