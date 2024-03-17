//
//  FavoriteLink.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation

enum FavoriteLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}
