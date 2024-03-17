//
//  Binding + ext.swift
//  SulimEffective
//
//  Created by Максим Сулим on 15.03.2024.
//

import SwiftUI

extension Binding where Value == String {
    func limit(_ lenght: Int) -> Self {
        if self.wrappedValue.count > lenght {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(lenght))
            }
        }
        return self
    }
}
