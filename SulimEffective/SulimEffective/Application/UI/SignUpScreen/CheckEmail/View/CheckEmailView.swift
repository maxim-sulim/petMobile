//
//  CheckEmailView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation
import SwiftUI
import Combine


struct CheckEmailView: View {
    
    @Binding var isAuth: Bool
    @Binding var selection: TabViewItemType
    @StateObject var viewModel: CheckEmailViewModel
    @FocusState private var showKeyBoard: Bool
    @State var otpText: String = ""
    
    var body: some View {
        CheckEmailFlowCoordinator(state: viewModel, content: content)
            .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text(viewModel.inputModel.title)
                    .font(Font(UIFont.Style.title2.font))
                    .foregroundStyle(.white)
                Text(viewModel.inputModel.message)
                    .font(Font(UIFont.Style.title3.font))
                    .foregroundStyle(.white)
                
                HStack(spacing: 10) {
                    ForEach(0..<4, id: \.self) { index in
                        otpText(index)
                    }
                }
                .background {
                    TextField("", text: $otpText.limit(4))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .frame(width: 1, height: 1)
                        .opacity(0.01)
                        .blendMode(.screen)
                        .focused($showKeyBoard)
                        .onReceive(Just(otpText), perform: { newValue in
                            let filter = newValue.filter({ $0.isNumber })
                            if filter != newValue {
                                self.otpText = filter
                            }
                        })
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    showKeyBoard.toggle()
                }
                .onAppear() {
                    showKeyBoard = true
                }
                
                Button {
                    selection = .search
                    isAuth = true
                    viewModel.setCurrentUser()
                } label: {
                    Text("Подтвердить")
                        .font(Font(UIFont.Style.buttonText1.font))
                }
                .buttonStyle(ButtonFill(color: Color(uiColor: ColorResourceAssets().blue)))
                .frame(maxWidth: .infinity)
                .disableWithOpacity(otpText.count < 4)
            }
            .padding(.horizontal, 10)
        }
    }
    
    @ViewBuilder private func otpText(_ index: Int) -> some View {
        ZStack(alignment: .center) {
            if otpText.count > index {
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
                    .font(.title2)
                    .foregroundStyle(Color(uiColor: ColorResourceAssets().grayLight))
            } else {
                Text("*")
                    .font(.title2)
                    .foregroundStyle(Color(uiColor: ColorResourceAssets().grayLight))
            }
        }
        .frame(width: 45, height: 45)
        .background(RoundedRectangle(cornerRadius: 6, style: .continuous)
            .foregroundStyle(Color(uiColor: ColorResourceAssets().grayMedium)))
    }
}
