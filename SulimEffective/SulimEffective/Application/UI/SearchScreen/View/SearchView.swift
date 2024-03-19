//
//  SearchView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    @State var searchText: String = ""
    @Binding var favoriteCount: Int
    
    var body: some View {
        SearchFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 16) {
                TopView(searchText: $searchText)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 6)
                ScrollView(.vertical) {
                    CaruselView(inputModel: CaruselInputModel.mockInit())
                        .padding(.leading, 10)
                    Spacer(minLength: 30)
                    HStack {
                        Text("Вакансии для вас")
                            .font(Font(UIFont.Style.title2.font))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    ForEach(viewModel.vacancyInputModel, id: \.id) { element in
                        VacancyView(isLike: element.islike,
                                    inputModel: element,
                                    delegate: viewModel,
                                    favoriteCount: $favoriteCount)
                        .onTapGesture {
                            viewModel.vacancyTapped(vacancy: element.object)
                        }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                    }
                    Button(viewModel.getTitleButton()) {
                        
                    }
                    .buttonStyle(ButtonFill(color: Color(uiColor: ColorResourceAssets().blue)))
                }
                .scrollIndicators(.hidden)
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .foregroundStyle(.gray)
                    .opacity(0.3)
            }
            .onAppear() {
                Task {
                    viewModel.fethLikeVacancy()
                }
            }
        }
    }
}
