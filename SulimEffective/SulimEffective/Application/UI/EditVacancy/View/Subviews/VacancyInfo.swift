//
//  VacancyInfo.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

struct InfoVacancyInputModel {
    let title: String
    let salary: String
    let experience: String
    let schedules: String
}

struct VacancyInfo: View {
    
    let inputModel: InfoVacancyInputModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(inputModel.title)
                    .font(Font(UIFont.Style.title1.font))
                    .foregroundStyle(.white)
                Text(inputModel.salary)
                    .foregroundStyle(.white)
                    .font(Font(UIFont.Style.text1.font))
                VStack(alignment: .leading) {
                    Text(inputModel.experience)
                        .foregroundStyle(.white)
                        .font(Font(UIFont.Style.text1.font))
                    Text(inputModel.schedules)
                        .foregroundStyle(.white)
                        .font(Font(UIFont.Style.text1.font))
                }
            }
            Spacer()
        }
    }
}
