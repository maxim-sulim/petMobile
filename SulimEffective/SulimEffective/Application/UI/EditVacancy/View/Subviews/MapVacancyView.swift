//
//  MapVacancyView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

struct MapVacancyInputModel {
    let company: String
    let address: String
}

struct MapVacancyView: View {
    let inputModel: MapVacancyInputModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Text(inputModel.company)
                    .foregroundStyle(Color.white)
                    .font(Font(UIFont.Style.title3.font))
                Image("check")
                Spacer()
            }
            Image("mockMap")
                .resizable()
                .frame(height: 70)
            Text(inputModel.address)
                .foregroundStyle(Color.white)
                .font(Font(UIFont.Style.buttonText2.font))
        }
        .padding(.all, 10)
        .background(RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(Color(uiColor: ColorResourceAssets().grayMedium)))
    }
}
