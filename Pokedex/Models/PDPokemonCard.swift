//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation
import SwiftUI

class PDPokemonCard: Identifiable, Hashable {

    static func == (lhs: PDPokemonCard, rhs: PDPokemonCard) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(pkmnId)
        hasher.combine(name)
        hasher.combine(type1)
        hasher.combine(imageURL)
        hasher.combine(backgroundColor1)
    }

    let pkmnId: Int
    let name: String
    let type1: PDPokemonType
    let type2: PDPokemonType?
    let imageURL: String
    let backgroundColor1: Color
    let backgroundColor2: Color?
    let moveNames: [String]
    
    init(pkmnId: Int, name: String, type1: PDPokemonType, type2: PDPokemonType?, imageURL: String, backgroundColor1: Color, backgroundColor2: Color?, moveNames: [String]) {
        self.pkmnId = pkmnId
        self.name = name
        self.type1 = type1
        self.type2 = type2
        self.imageURL = imageURL
        self.backgroundColor1 = backgroundColor1
        self.backgroundColor2 = backgroundColor2
        self.moveNames = moveNames
    }

}
