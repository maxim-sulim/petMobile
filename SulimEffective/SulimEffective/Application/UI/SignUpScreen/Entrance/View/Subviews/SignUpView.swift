//
//  SignUpView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import SwiftUI
import Combine

struct SignUpView: View {
    @Binding var text: String
    @Binding var selected: TabViewItemType
    @Binding var isAuth: Bool
    @EnvironmentObject var viewModel: EntranceViewModel
    
    var body: some View {
            VStack {
                HStack {
                    Text("Поиск работы")
                        .foregroundStyle(.white)
                        .font(Font(UIFont.Style.title3.font))
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                TextFieldView(validError: $viewModel.validError, text: $text, inputModel: TextFieldInputModel(image: "envelope",
                                                                           placeholder: "Электронна почта или теелфон"))
                .onReceive(Just(text), perform: { newValue in
                    viewModel.checkError(text: newValue)
                })
                .padding(.top, 10)
                .padding(.horizontal, 20)
                if viewModel.validError {
                    HStack {
                        Text("Errroror")
                            .foregroundStyle(.red)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
                HStack(spacing: 60) {
                    Button {
                        viewModel.nextTapped(email: text,
                                             selected: $selected,
                                             isAuth: $isAuth)
                    } label: {
                         Text("Продолжить")
                            .font(Font(UIFont.Style.buttonText2.font))
                    }
                    .buttonStyle(ButtonFillSlim())
                    .disableWithOpacity(text == "")
                    
                    Button {
                        
                    } label: {
                        Text("Войти с паролем")
                            .font(Font(UIFont.Style.buttonText2.font))
                    }
                }
                .padding(.leading, 20)
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color(uiColor: ColorResourceAssets().grayDark)))
            .padding(.horizontal, 20)
    }
}
