//
//  EntranceLink.swift
//  SulimEffective
//
//  Created by Максим Сулим on 14.03.2024.
//

import Foundation
import SwiftUI

enum EntranceLink: Identifiable {
    case checkEmail(CheckEmailModel)

    var id: String {
        String(describing: self)
    }
}

extension EntranceLink: Hashable {
    static func == (lhs: EntranceLink, rhs: EntranceLink) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
