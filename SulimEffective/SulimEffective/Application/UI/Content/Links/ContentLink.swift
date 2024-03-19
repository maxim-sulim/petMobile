//
//  ContentLink.swift
//  SulimEffective
//
//  Created by Максим Сулим on 19.03.2024.
//

import Foundation
enum ContentLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}
