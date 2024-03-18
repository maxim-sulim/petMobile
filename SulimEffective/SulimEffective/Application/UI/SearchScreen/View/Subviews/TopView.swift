//
//  TopView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation
import SwiftUI

struct TopView: View {
    @Binding var searchText: String
    @State var mockError = false
    var body: some View {
        HStack(spacing: 20) {
            TextFieldView(validError: $mockError, text: $searchText, inputModel: TextFieldInputModel(image: "magnifier",
                                                                             placeholder: "Должность, ключевые слова"))
            Button {
                
            } label: {
                Image("filter")
            }
            .background(RoundedRectangle(cornerRadius: 6, style: .circular)
                .foregroundStyle(Color(uiColor: ColorResourceAssets().grayMedium))
                .frame(width: 36, height: 36))
        }
    }
}
