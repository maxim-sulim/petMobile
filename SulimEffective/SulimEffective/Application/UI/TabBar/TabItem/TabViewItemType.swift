//
//  TabViewItemType.swift
//  SulimEffective
//
//  Created by Максим Сулим on 14.03.2024.
//

import Foundation
import SwiftUI

enum TabViewItemType: String, Hashable {
    case search = "Поиск"
    case heart = "Избранное"
    case responses = "Отклики"
    case message = "Сообщения"
    case profile = "Проифль"

    var image: Image {
        switch self {
        case .search:  return Image("magnifier")
        case .heart:   return Image("heart")
        case .responses: return Image("envelope")
        case .message: return Image("messages")
        case .profile: return Image("profile")
        }
    }

    var text: Text {
        Text(self.rawValue)
    }
}

struct TabViewItem: View {
    var type: TabViewItemType
    
    var body: some View {
        VStack {
            type.image
            type.text
        }
    }
}
