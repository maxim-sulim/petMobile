//
//  SearchLink.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import Foundation

enum SearchLink: Identifiable {
    case edit(Vacancy)

    var id: String {
        String(describing: self)
    }
}

extension SearchLink: Hashable {
    static func == (lhs: SearchLink, rhs: SearchLink) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
