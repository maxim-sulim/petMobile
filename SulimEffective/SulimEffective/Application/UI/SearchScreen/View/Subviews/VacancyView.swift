//
//  Vacancy.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import SwiftUI

struct VacancyInputModel {
    let id: String = UUID().uuidString
    var islike: Bool
    let looking: Int?
    let countViewing: String
    let title: String
    let place: String
    let company: String
    let expirence: String
    let publication: String
    let object: Vacancy
}

protocol Likebutton {
    func unlikeVacancy(vakancy: Vacancy) async
    func likeVacancy(vakancy: Vacancy) async
}

struct VacancyView: View {
    @State var isLike: Bool
    let inputModel: VacancyInputModel
    var delegate: Likebutton
    @Binding var favoriteCount: Int
    
    var body: some View {
        ZStack() {
            HStack {
                Spacer()
                VStack {
                    Button {
                        Task {
                            if isLike {
                                await delegate.unlikeVacancy(vakancy: inputModel.object)
                                favoriteCount -= 1
                            } else {
                                await delegate.likeVacancy(vakancy: inputModel.object)
                                favoriteCount += 1
                            }
                            isLike.toggle()
                        }
                    } label: {
                        if isLike {
                            Image("activeHeart")
                                .resizable()
                                .frame(width: 24, height: 24)
                        } else {
                            Image("heart")
                                .resizable()
                                .frame(width: 24, height: 22)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            VStack(spacing: 10) {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        if inputModel.looking != nil {
                            Text(inputModel.countViewing)
                                .font(Font(UIFont.Style.text1.font))
                                .foregroundStyle(Color(uiColor: ColorResourceAssets().greenLight))
                        }
                        Text(inputModel.title)
                            .font(Font(UIFont.Style.title3.font))
                            .foregroundStyle(Color.white)
                            .padding(.trailing, 40)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(inputModel.place)
                                .foregroundStyle(Color.white)
                                .font(Font(UIFont.Style.text1.font))
                            HStack {
                                Text(inputModel.company)
                                    .foregroundStyle(Color.white)
                                    .font(Font(UIFont.Style.text1.font))
                                Image("check")
                            }
                        }
                        HStack {
                            Image("expirance")
                            Text(inputModel.expirence)
                                .foregroundStyle(Color.white)
                                .font(Font(UIFont.Style.text1.font))
                        }
                        Text(inputModel.publication)
                            .foregroundStyle(Color(uiColor: ColorResourceAssets().grayLight))
                            .font(Font(UIFont.Style.text1.font))
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                Button("Откликнуться") {
                    
                }
                .buttonStyle(ButtonFillCapsule())
                
            }
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Color(uiColor: ColorResourceAssets().grayMedium)))
    }
}
