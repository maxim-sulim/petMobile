//
//  TopEditView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

struct TopEditView: View {
    @EnvironmentObject var viewModel: EditVacancyViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            Button {
                viewModel.popScene()
            } label: {
                Image("leftArrow")
            }
            Spacer()
            Image("eyeOpen")
            Image("share")
            if viewModel.checkLikeVaccancy() {
                Image("activeHeart")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .background(.clear)
    }
}
