//
//  PDPokemonDetails.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation

struct PDPokemonDetails: Codable {
    let abilities: [PDAbilities]
    let base_experience: Int?
    let forms: [PDForms]
    let game_indices: [PDGameIndices]
    let height: Int?
    let held_items: [PDHeldItems]
    let id: Int
    let is_default: Bool?
    let location_area_encounters: String?
    let moves: [PDMoves]
    let name: String
    let order: Int?
    let past_types: [PDPastTypes]
    let species: PDSpecies?
    let sprites: PDSprites?
    let stats: [PDStats]
    let types: [PDTypes]
    let weight: Int?
}

// MARK: - Other structs to be separated into other files
struct PDMoves: Codable {
    let move: PDMove
}

struct PDMove: Codable {
    let name: String
    let url: String
}

struct PDSprites: Codable {

    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    let other: PDOther
    let versions: PDVersions

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other, versions
    }

}

struct PDTypes: Codable {

    let slot: Int
    let pokemonActualType: PDPokemonActualType

    enum CodingKeys: String, CodingKey {
        case slot
        case pokemonActualType = "type"
    }

}

struct PDPokemonActualType: Codable {
    let name: String
    let url: String
}

struct PDOther: Codable {

    let dreamWorld: PDDreamWorld
    let home: PDHome
    let officialArtwork: PDOfficialArtwork

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
        case home
    }

}
// MARK: - Next structs to be created if the app were to be continued
struct PDVersions: Codable {}

struct PDDreamWorld: Codable {}

struct PDHome: Codable {}

struct PDOfficialArtwork: Codable {}

struct PDStats: Codable {}

struct PDPastTypes: Codable {}

struct PDSpecies: Codable {}

struct PDAbilities: Codable {}

struct PDForms: Codable {}

struct PDGameIndices: Codable {}

struct PDHeldItems: Codable {}
