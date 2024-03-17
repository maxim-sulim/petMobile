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
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                if inputModel.looking != nil {
                    Text(inputModel.countViewing)
                        .font(.system(size: 12))
                        .foregroundStyle(Color(uiColor: ColorResourceAssets().greenLight))
                }
                Spacer()
                Button {
                    Task {
                        if isLike {
                            await delegate.unlikeVacancy(vakancy: inputModel.object)
                        } else {
                            await delegate.likeVacancy(vakancy: inputModel.object)
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
            }
            .frame(height: 35)
            .padding(.horizontal, 20)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(inputModel.title)
                        .font(.title3)
                        .foregroundStyle(Color.white)
                    Text(inputModel.place)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 12))
                    HStack {
                        Text(inputModel.company)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 12))
                        Image("check")
                    }
                    HStack {
                        Image("expirance")
                        Text(inputModel.expirence)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 12))
                    }
                    Text(inputModel.publication)
                        .foregroundStyle(Color(uiColor: ColorResourceAssets().grayLight))
                }
                Spacer()
            }
            .padding(.leading, 20)
            Button("Откликнуться") {
                
            }
            .buttonStyle(ButtonFillCapsule())
            
        }
        .padding(.top, 10)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Color(uiColor: ColorResourceAssets().grayMedium)))
    }
}
