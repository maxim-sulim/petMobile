//
//  DescriptionVacancyView.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import SwiftUI

struct DescriptionVacancyView: View {
    
    let description: String
    
    var body: some View {
        VStack {
            Text(description)
                .foregroundStyle(.white)
                .font(Font(UIFont.Style.buttonText2.font))
        }
    }
}
