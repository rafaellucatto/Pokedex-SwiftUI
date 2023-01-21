//
//  PDPokemonCardDetailsViewModel.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import AVFoundation
import Foundation

final class PDPokemonCardDetailsViewModel: ObservableObject {

    private let synthesizer: AVSpeechSynthesizer = .init()

    private let pokemonCard: PDPokemonCard

    init(pokemonCard: PDPokemonCard) {
        self.pokemonCard = pokemonCard
    }

    var name: String { pokemonCard.name.capitalized }

    var imageURL: String { K.Card.Details.imageURL(pkmnId) }

    @Published var pkmnDescription: String = ""

    var hasTwoTypes: Bool { pokemonCard.type2 != nil }

    var type1: PDPokemonType { pokemonCard.type1 }

    var type2: PDPokemonType? { pokemonCard.type2 }

    var pkmnId: String { pokemonCard.pkmnId.description }

    var moves: [String] { pokemonCard.moveNames }

    func requestPokemonDescription(pkmnId: String) {
        RequestManager.shared.request(url: K.Card.Details.url(pkmnId), expectedType: PDPokemonSpecies.self) { [weak self] result in
            switch result {
            case .success(let pkmnSpecies):
                var _description: String = pkmnSpecies.flavorTextEntries[1].flavorText
                _description = _description.replacingOccurrences(of: "\n", with: " ")
                DispatchQueue.main.async {
                    self?.pkmnDescription = _description
                }
            case .failure:
                print("Unable to get data for PokémonSpecies")
            }
        }
    }

    func listenDescription() {
        if pkmnDescription != "" {
            synthesizer.stopSpeaking(at: .immediate)
            let speechUtterance: AVSpeechUtterance = .init(string: pkmnDescription)
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechUtterance.rate = 0.5
            synthesizer.speak(speechUtterance)
        }
    }

}
