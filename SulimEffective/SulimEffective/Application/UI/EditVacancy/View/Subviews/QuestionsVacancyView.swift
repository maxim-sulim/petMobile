//
//  QuestionsVacancyView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

struct QuestionsVacancyView: View {
    
    let questions: [String]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Задайте вопрос работодателю")
                    .foregroundStyle(.white)
                    .font(Font(UIFont.Style.title4.font))
                Text("Он получит его с откликом на вакансию")
                    .foregroundStyle(Color(uiColor: ColorResourceAssets().grayLight))
                    .font(Font(UIFont.Style.title4.font))
                ForEach(0..<questions.count, id: \.self) { index in
                    Text(questions[index])
                        .foregroundStyle(.white)
                        .font(Font(UIFont.Style.title4.font))
                        .padding(.all, 10)
                        .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(Color(uiColor: ColorResourceAssets().grayMedium)))
                }
            }
            Spacer()
        }
    }
}
