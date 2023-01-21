//
//  PDPokedex.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation

struct PDPokedex: Codable {

    let pokemonCount: Int?
    let next: String?
    let previous: String?
    let pokemon: [PDPokemon]

    enum CodingKeys: String, CodingKey {
        case pokemonCount = "count"
        case next
        case previous
        case pokemon = "results"
    }

}
