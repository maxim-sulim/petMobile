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
    
    var body: some View {
        SearchFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 16) {
                TopView(searchText: $searchText)
                    .padding(.horizontal, 10)
                Spacer(minLength: 10)
                ScrollView(.vertical) {
                    CaruselView(inputModel: CaruselInputModel.mockInit())
                        .padding(.leading, 10)
                    Spacer(minLength: 20)
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
                                    delegate: viewModel)
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
            }
            .onAppear() {
                Task {
                    viewModel.fethLikeVacancy()
                }
            }
        }
    }
}
