//
//  PokemonCard+Extension.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation
import SwiftUI

extension PDPokemonCard {
    
    /// A stub created for previewing the view and testing it
    /// - Parameters:
    ///   - pkmnId: pokémon id
    ///   - name: pokémon name
    ///   - type1: pokémon type 1
    ///   - type2: pokémon type 2 (if it has a second type)
    ///   - imageURL: URL to get its image from
    ///   - backgroundColor1: background color based on the first type
    ///   - backgroundColor2: background color based on the second type (if it has a second type)
    ///   - moveNames: list of attacks
    /// - Returns: it returns a PokémonCard object
    static func stub(pkmnId: Int = 25,
                     name: String = "Pikachu",
                     type1: PDPokemonType = .electric,
                     type2: PDPokemonType? = nil,
                     imageURL: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
                     backgroundColor1: Color = .yellow,
                     backgroundColor2: Color? = nil,
                     moveNames: [String] = ["Surf", "Slam", "Thunder", "Thunder-Wave"]) -> PDPokemonCard {
        .init(pkmnId: pkmnId,
              name: name,
              type1: type1,
              type2: type2,
              imageURL: imageURL,
              backgroundColor1: backgroundColor1,
              backgroundColor2: backgroundColor2,
              moveNames: moveNames)
    }

}
