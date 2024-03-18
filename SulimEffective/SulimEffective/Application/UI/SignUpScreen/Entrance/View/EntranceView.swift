//
//  EntranceView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 14.03.2024.
//

import Foundation
import SwiftUI

struct EntranceView: View {
    @StateObject var viewModel: EntranceViewModel
    @Binding var selection: TabViewItemType
    @State var text: String = ""
    
    var body: some View {
        EntranceFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                HStack {
                    Text("Вход в личный кабинет")
                        .font(Font(UIFont.Style.title2.font))
                    Spacer()
                }
                Spacer()
                SignUpView(text: $text, selected: $selection)
                    .environmentObject(viewModel)
                EmployerSignUpView()
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .top)
        }
    }
}


