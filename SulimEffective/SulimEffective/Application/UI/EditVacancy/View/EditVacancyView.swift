//
//  EditVacancyView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

struct EditVacancyView: View {
    
    @StateObject var viewModel: EditVacancyViewModel
    let inputModel: EditVacancyInputModel
    
    var body: some View {
        EditVacancyFlowCoordinator(state: viewModel, content: content)
            .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                TopEditView()
                    .environmentObject(viewModel)
                    .padding(.bottom, 12)
                ScrollView(.vertical) {
                    VacancyInfo(inputModel: InfoVacancyInputModel(title: inputModel.title,
                                                                  salary: inputModel.salary,
                                                                  experience: inputModel.experience,
                                                                  schedules: inputModel.schedules))
                    Spacer(minLength: 20)
                    if inputModel.looking != nil || inputModel.applied != nil {
                        HStack {
                            if let applied = inputModel.applied {
                                InterBarView(inputModel: InterBarInputModel(text: applied,
                                                                            image: "personSmall"))
                                Spacer()
                            }
                            
                            if let looking = inputModel.looking {
                                InterBarView(inputModel: InterBarInputModel(text: looking,
                                                                            image: "eyeSmall"))
                                Spacer()
                            }
                        }
                        .padding(.bottom, 6)
                    }
                    MapVacancyView(inputModel: MapVacancyInputModel(company: inputModel.company,
                                                                    address: inputModel.address))
                    .padding(.bottom, 6)
                    if let description = inputModel.description {
                        DescriptionVacancyView(description: description)
                            .padding(.top, 6)
                    }
                    HStack {
                        Text("Ваши задачи")
                            .font(Font(UIFont.Style.title2.font))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    DescriptionVacancyView(description: inputModel.responsibilities)
                        .padding(.top, 6)
                    QuestionsVacancyView(questions: inputModel.questions)
                        .padding(.vertical, 10)
                    Button("Откликнуться") {
                        
                    }
                    .buttonStyle(ButtonFill(color: Color(uiColor: ColorResourceAssets().greenLight)))
                    Spacer()
                }
            }
            .padding(.horizontal, 10)
        }
    }
}
