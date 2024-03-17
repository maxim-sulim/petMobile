//
//  EmployerSignUpView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import SwiftUI

struct EmployerSignUpView: View {
    var body: some View {
        VStack(spacing: 10) {
            Spacer(minLength: 20)
            HStack {
                Text("Поиск сотрудников")
                    .foregroundStyle(.white)
                    .font(.title3)
                Spacer()
            }
            .padding(.leading, 20)
            HStack {
                Text("Размещение вакансий и доступ к базе резюме")
                    .foregroundStyle(.white)
                    .font(Font.system(size: 13))
                Spacer()
            }
            .padding(.leading, 20)
            Button("Я ищу сотрудников") {
                
            }
            .buttonStyle(ButtonFillCapsule())
            Spacer(minLength: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Color(uiColor: ColorResourceAssets().grayDark)))
        .padding(.horizontal, 20)
    }
}
