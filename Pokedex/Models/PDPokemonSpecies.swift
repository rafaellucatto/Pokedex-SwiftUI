//
//  PDPokemonSpecies.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation
/// Structs to get the Pokémon description
struct PDPokemonSpecies: Codable {

    let flavorTextEntries: [PDFlavorText]

    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }

}

struct PDFlavorText: Codable {

    let flavorText: String

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
    }

}
