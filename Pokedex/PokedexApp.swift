//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            PDMainView(viewModel: PDMainViewModel())
        }
    }
}
