//
//  SignUpView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import SwiftUI

struct SignUpView: View {
    @Binding var text: String
    @Binding var selected: TabViewItemType
    @EnvironmentObject var viewModel: EntranceViewModel
    
    var body: some View {
            VStack(spacing: 20) {
                HStack {
                    Text("Поиск работы")
                        .foregroundStyle(.white)
                        .font(.title3)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                TextFieldView(text: $text, inputModel: TextFieldInputModel(image: "envelope",
                                                                           placeholder: "Электронна почта или теелфон"))
                .padding(.horizontal, 20)
                HStack(spacing: 30) {
                    Button("Продолжить") {
                        viewModel.nextTapped(email: text, selected: $selected)
                    }
                    .buttonStyle(ButtonFillSlim())
                    .disableWithOpacity(text == "")
                    Button {
                        
                    } label: {
                        Text("Войти с паролем")
                            .tint(.blue)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color(uiColor: ColorResourceAssets().grayDark)))
            .padding(.horizontal, 20)
    }
}
