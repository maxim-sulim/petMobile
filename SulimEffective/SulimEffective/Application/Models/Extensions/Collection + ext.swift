//
//  Collection + ext.swift
//  SulimEffective
//
//  Created by Максим Сулим on 19.03.2024.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return saveObject(at: index)
    }
    
    ///Safely removing the element
    func saveObject(at index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
