//
//  Constants.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation
import SwiftUI
import UIKit
/// An enum for Constants
enum K {
    /// Fixed URLs for getting pokémon collection, separated by generations
    enum Url {
        /// URL for gen 1 pokémon collection
        static let gen1: String = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151"
        /// URL for gen 2 pokémon collection
        static let gen2: String = "https://pokeapi.co/api/v2/pokemon?offset=151&limit=100"
        /// URL for gen 3 pokémon collection
        static let gen3: String = "https://pokeapi.co/api/v2/pokemon?offset=251&limit=135"
        /// URL for gen 4 pokémon collection
        static let gen4: String = "https://pokeapi.co/api/v2/pokemon?offset=386&limit=107"
    }
    /// Cards that are shown on the main screen
    enum Card {
        /// Main view card width constant
        static let width: CGFloat = UIScreen.main.bounds.width * 0.475
        /// Main view card height constant
        static let height: CGFloat = UIScreen.main.bounds.height * 0.15
        /// Main view card pokémon id
        static let pkmnId: (String) -> String = { "#\($0)" }
        /// PokémonDetail view after choosing a pokémon on the main screen
        enum Details {
            /// URL for requesting detailed data about the pokémon
            static let url: (String) -> String = { "https://pokeapi.co/api/v2/pokemon-species/\($0)" }
            /// Image URL for the image to be shown in the detail view
            static let imageURL: (String) -> String = { "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\($0).png" }
        }
    }
}
