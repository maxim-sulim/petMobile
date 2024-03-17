//
//  SearchLink.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation

enum SearchLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}

