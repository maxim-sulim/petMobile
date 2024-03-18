//
//  TextFieldView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation
import SwiftUI

struct TextFieldInputModel {
    let image: String
    let placeholder: String
}

struct TextFieldView: View {
    @Binding var validError: Bool
    @Binding var text: String
    let inputModel: TextFieldInputModel
    
    var body: some View {
        HStack {
            if text == "" {
                Image(inputModel.image)
                    .foregroundStyle(Color(uiColor: ColorResourceAssets().grayLight))
                    .padding(.leading, 10)
            }
            Spacer(minLength: 10)
            TextField(text: $text, label: {
                Text(inputModel.placeholder)
                    .foregroundStyle(Color(uiColor: ColorResourceAssets().grayLight))
                    .font(Font(UIFont.Style.text1.font))
                    .padding(.leading, 10)
            })
            .tint(.white)
            .foregroundStyle(.white)
            
            Spacer(minLength: 10)
            if text != "" {
                Button {
                    text = ""
                    validError = false
                } label: {
                    Image(systemName: "multiply")
                        .foregroundStyle(Color(uiColor: ColorResourceAssets().grayLight))
                        .padding(.trailing, 10)
                }
            }
        }
        .frame(height: 40)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Color(uiColor: ColorResourceAssets().grayMedium)))
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(validError ? Color.red : Color.clear, lineWidth: 1))
        .shadow(color: Color(uiColor: .black).opacity(0.5),
                radius: 3, x: 1, y: 5)
    }
}
