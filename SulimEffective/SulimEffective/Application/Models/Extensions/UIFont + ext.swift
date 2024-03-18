//
//  UIFont + ext.swift
//  SulimEffective
//
//  Created by Максим Сулим on 17.03.2024.
//

import Foundation
import UIKit

extension UIFont {
    enum Style {
        case text1
        case title1
        case title2
        case title3
        case title4
        case number
        case buttonText1
        case buttonText2
        
        var font: UIFont {
            switch self {
            case .text1: return UIFont.sfDisplayFont(ofSize: 14, font: .regular)
            case .title1: return UIFont.sfDisplayFont(ofSize: 22, font: .semibold)
            case .title2: return UIFont.sfDisplayFont(ofSize: 20, font: .semibold)
            case .title3: return UIFont.sfDisplayFont(ofSize: 16, font: .medium)
            case .title4: return UIFont.sfDisplayFont(ofSize: 14, font: .medium)
            case .number: return UIFont.sfDisplayFont(ofSize: 7, font: .regular)
            case .buttonText1: return UIFont.sfDisplayFont(ofSize: 16, font: .semibold)
            case .buttonText2: return UIFont.sfDisplayFont(ofSize: 14, font: .regular)
            }
        }
    }
    
    enum Font: String {
        case regular = "SFProDisplay-Regular"
        case medium = "SFProDisplay-Medium"
        case semibold = "SFProDisplay-Semibold"
    }
    
    static func sfDisplayFont(ofSize fontSize: CGFloat, font: Font) -> UIFont {
        return self.init(name: font.rawValue, size: fontSize)!
    }
}
