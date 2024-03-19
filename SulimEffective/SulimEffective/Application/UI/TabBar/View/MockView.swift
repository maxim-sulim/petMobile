//
//  MockView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 19.03.2024.
//

import Foundation
import SwiftUI

struct MockView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .foregroundStyle(.gray)
                    .opacity(0.3)
                
            }
        }
    }
}
