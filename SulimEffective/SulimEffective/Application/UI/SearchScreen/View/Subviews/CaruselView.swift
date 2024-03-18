//
//  CaruselView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation
import SwiftUI

struct CaruselInputModel {
    let item: [CaruselElement]
    
    static func mockInit() -> CaruselInputModel {
        var mockModel: [CaruselElement] = []
        mockModel.append(CaruselElement(title: "Вакансии рядом с вами",
                                        image: "geo",
                                        colorImage: Color(uiColor: ColorResourceAssets().specialBlue), button: nil))
        mockModel.append(CaruselElement(title: "Поднять резюме в поиске",
                                        image: "star",
                                        colorImage: Color(uiColor: ColorResourceAssets().darkGreen), button: "Поднять"))
        mockModel.append(CaruselElement(title: "Временная работа и подработка",
                                        image: "list",
                                        colorImage: Color(uiColor: ColorResourceAssets().darkGreen), button: nil))
        return CaruselInputModel(item: mockModel)
    }
}

struct CaruselElement {
    let id: String = UUID().uuidString
    let title: String
    let image: String
    let colorImage: Color
    let button: String?
}

struct CaruselView: View {
    let inputModel: CaruselInputModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(inputModel.item, id: \.id) { element in
                    VStack(alignment: .leading) {
                        Image(element.image)
                            .background(
                                Circle()
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(element.colorImage))
                            .padding(.vertical, 10)
                        Text(element.title)
                            .foregroundStyle(.white)
                            .font(Font(UIFont.Style.title4.font))
                            .padding(.bottom, 2)
                        if let button = element.button {
                            Button {
                                
                            } label: {
                                Text(button)
                                    .foregroundStyle(Color(uiColor: ColorResourceAssets().greenLight))
                                    .font(Font(UIFont.Style.text1.font))
                            }
                        }
                        Spacer()
                    }
                    .frame(width: 132, height: 120)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(uiColor: ColorResourceAssets().grayMedium)))
                }
                
            }
        }
        .scrollIndicators(.hidden)
    }
}
