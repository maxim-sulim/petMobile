//
//  ButtonDesign.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import SwiftUI

struct ButtonFillCapsule: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                    .fill(Color(uiColor: ColorResourceAssets().greenLight))
                    .opacity(configuration.isPressed ? 0.5 : 1)
                    .frame(width: 310, height: 36))
                .foregroundStyle(.white)
        }
}

struct ButtonFillSlim: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: ColorResourceAssets().blue))
                    .opacity(configuration.isPressed ? 0.5 : 1)
                    .frame(width: 137, height: 36))
                .foregroundStyle(.white)
        }
}

struct ButtonFill: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(RoundedRectangle(cornerRadius: 8)
                    .fill(Color(uiColor: ColorResourceAssets().blue))
                    .opacity(configuration.isPressed ? 0.5 : 1)
                    .frame(width: 370, height: 50))
                .foregroundStyle(.white)
        }
}
