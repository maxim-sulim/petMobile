//
//  SulimEffectiveApp.swift
//  SulimEffective
//
//  Created by Максим Сулим on 14.03.2024.
//

import SwiftUI

@main
struct SulimEffectiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
