//
//  PDMainViewModel.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation
import SwiftUI


protocol PDMainViewModelProtocol: ObservableObject {
    var backgroundColor: Color { get }
    var pokemonCards: [PDPokemonCard] { get set }
    var pokemonNameSearch: String { get set }
    func didPressGen1()
    func didPressGen2()
    func didPressGen3()
    func didPressGen4()
    func fetchPokemon(for selectedGeneration: PDSelectedGeneration)
}
/// First view shown to the user, it tries to imitate a Pokédex
class PDMainViewModel: PDMainViewModelProtocol {
    /// An instance of the request manager class
    private let requestManager: RequestManager = .shared
    /// A collection of URL in string format, each one represents details of one pokémon
    private var pokemonURLs: [String] = []
    /// Collection of Pokémon presented by the view (like a Pokédex)
    @Published var pokemonCards: [PDPokemonCard] = []
    /// Variable to adjust the background color according to the chosen generation
    @Published var backgroundColor: Color = .gen1
    /// Variable for the user to look for the pokemon they want
    @Published var pokemonNameSearch: String = ""
    /// Variables to keep track of which generation has been selected by the user
    @State private var isGen1Selected: Bool = true
    @State private var isGen2Selected: Bool = false
    @State private var isGen3Selected: Bool = false
    @State private var isGen4Selected: Bool = false
    /// Deselect all pokémon generations
    private func setAllGensToFalse() {
        isGen1Selected = false
        isGen2Selected = false
        isGen3Selected = false
        isGen4Selected = false
    }
    /// Handles gen1-choosing button option
    func didPressGen1() {
        setAllGensToFalse()
        isGen1Selected = true
        backgroundColor = .gen1
        fetchPokemon(for: .gen1)
    }
    /// Handles gen2-choosing button option
    func didPressGen2() {
        setAllGensToFalse()
        isGen2Selected = true
        backgroundColor = .gen2
        fetchPokemon(for: .gen2)
    }
    /// Handles gen3-choosing button option
    func didPressGen3() {
        setAllGensToFalse()
        isGen3Selected = true
        backgroundColor = .gen3
        fetchPokemon(for: .gen3)
    }
    /// Handles gen4-choosing button option
    func didPressGen4() {
        setAllGensToFalse()
        isGen4Selected = true
        backgroundColor = .gen4
        fetchPokemon(for: .gen4)
    }
    /// Makes request in order to get pokémon data
    /// - Parameter selectedGeneration: generation whose pokémon the user wants to look for
    func fetchPokemon(for selectedGeneration: PDSelectedGeneration) {
        requestManager.request(url: selectedGeneration.getURL, expectedType: PDPokedex.self) { [weak self] result in
            switch result {
            case .failure:
                print("Unable to get data for Pokédex from request.")
            case .success(let pokedex):
                self?.pokemonCards.removeAll()
                self?.pokemonURLs.removeAll()
                for pokemon in pokedex.pokemon {
                    if let stringURL: String = pokemon.url {
                        self?.pokemonURLs.append(stringURL)
                    }
                }
            }
            guard let pkmnURLs: [String] = self?.pokemonURLs else { return }
            for url in pkmnURLs {
                self?.requestManager.request(url: url, expectedType: PDPokemonDetails.self) { result in
                    switch result {
                    case .failure:
                        print("Unable to get data for PokemonDetails from request.")
                    case .success(let pokemonDetails):
                        let pkmnId: Int = pokemonDetails.id
                        let name: String = pokemonDetails.name
                        let type1: PDPokemonType = .getType(pkmnType: pokemonDetails.types[0].pokemonActualType.name)
                        var type2: PDPokemonType? = nil
                        if pokemonDetails.types.count > 1 {
                            type2 = .getType(pkmnType: pokemonDetails.types[1].pokemonActualType.name)
                        }
                        var pkmnSprite: String = ""
                        if let frontDefault: String = pokemonDetails.sprites?.frontDefault {
                            pkmnSprite = frontDefault
                        }
                        var moves: [String] = []
                        for eachMove in pokemonDetails.moves {
                            moves.append(eachMove.move.name)
                        }
                        
                        let pkmnCard: PDPokemonCard = .init(pkmnId: pkmnId,
                                                          name: name,
                                                          type1: type1,
                                                          type2: type2,
                                                          imageURL: pkmnSprite,
                                                          backgroundColor1: type1.getColor(),
                                                          backgroundColor2: type2?.getColor() ?? nil,
                                                          moveNames: moves)
                        DispatchQueue.main.async {
                            self?.pokemonCards.append(pkmnCard)
                            self?.pokemonCards.sort { $0.pkmnId < $1.pkmnId }
                        }
                    }
                }
            }
        }
    }

}

