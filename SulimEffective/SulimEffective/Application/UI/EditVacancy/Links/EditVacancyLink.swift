//
//  EditVacancyLink.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation

enum EditVacancyLink: Hashable, Identifiable {
    case link

    var id: String {
        String(describing: self)
    }
}
