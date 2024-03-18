//
//  InterBarView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

struct InterBarInputModel {
    let text: String
    let image: String
}

struct InterBarView: View {
    let inputModel: InterBarInputModel
    
    var body: some View {
        HStack(spacing: 20) {
            Text(inputModel.text)
                .foregroundStyle(.white)
                .font(Font(UIFont.Style.buttonText2.font))
            VStack {
                Image(inputModel.image)
                    .background(
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color(uiColor: ColorResourceAssets().greenLight)))
                    .padding(.top, 15)
                    .padding(.trailing, 10)
                Spacer()
            }
        }
        .padding(.leading, 10)
        .frame(width: 180, height: 60)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Color(uiColor: ColorResourceAssets().greenLight)))
    }
}
