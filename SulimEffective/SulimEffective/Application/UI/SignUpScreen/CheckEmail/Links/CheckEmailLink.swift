//
//  CheckEmailLink.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation

enum CheckEmailLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}
