//
//  PDPokemonCardViewModel.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/20/23.
//

import Foundation
import SwiftUI

final class PDPokemonCardViewModel {

    private let pokemonCard: PDPokemonCard

    init(pokemonCard: PDPokemonCard) {
        self.pokemonCard = pokemonCard
    }

    var hasTwoTypes: Bool { pokemonCard.type2 != nil }

    var name: String { pokemonCard.name.capitalized }

    var id: String { K.Card.pkmnId(pokemonCard.pkmnId.description) }

    var imageURL: String { pokemonCard.imageURL }

    var bgColor1: Color { pokemonCard.backgroundColor1 }

    var bgColor2: Color? { pokemonCard.backgroundColor2 }

}
