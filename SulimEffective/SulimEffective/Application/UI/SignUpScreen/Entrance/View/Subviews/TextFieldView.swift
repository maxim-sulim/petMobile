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
                    .font(Font.system(size: 14))
                    .padding(.leading, 10)
            })
            Spacer(minLength: 10)
            if text != "" {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "multiply")
                        .foregroundStyle(Color(uiColor: ColorResourceAssets().grayLight))
                        .padding(.trailing, 10)
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 10)
            .frame(height: 36)
            .foregroundStyle(Color(uiColor: ColorResourceAssets().grayMedium))
            .shadow(color: Color(uiColor: .black).opacity(0.5),
                    radius: 3, x: 1, y: 5))
    }
}
