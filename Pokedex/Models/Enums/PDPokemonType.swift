//
//  PDPokemonType.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation
import SwiftUI

/// An enum to handle pokémon type characteristics
enum PDPokemonType: String {

    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water

    func getColor() -> Color {
        switch self {
        case .bug:
            return Color(UIColor(displayP3Red: 145/255, green: 168/255, blue: 50/255, alpha: 1))
        case .dark:
            return Color(UIColor(displayP3Red: 115/255, green: 65/255, blue: 20/255, alpha: 1))
        case .dragon:
            return Color(UIColor(displayP3Red: 151/255, green: 83/255, blue: 207/255, alpha: 1))
        case .electric:
            return Color(UIColor(displayP3Red: 225/255, green: 200/255, blue: 0/255, alpha: 1))
        case .fairy:
            return Color(UIColor(displayP3Red: 199/255, green: 103/255, blue: 188/255, alpha: 1))
        case .fighting:
            return Color(UIColor(displayP3Red: 199/255, green: 68/255, blue: 70/255, alpha: 1))
        case .fire:
            return Color(UIColor(displayP3Red: 255/255, green: 0/255, blue: 0/255, alpha: 1))
        case .flying:
            return Color(UIColor(displayP3Red: 173/255, green: 135/255, blue: 85/255, alpha: 1))
        case .ghost:
            return Color(UIColor(displayP3Red: 173/255, green: 140/255, blue: 230/255, alpha: 1))
        case .grass:
            return Color(UIColor(displayP3Red: 24/255, green: 220/255, blue: 14/255, alpha: 1))
        case .ground:
            return Color(UIColor(displayP3Red: 160/255, green: 80/255, blue: 20/255, alpha: 1))
        case .ice:
            return Color(UIColor(displayP3Red: 100/255, green: 225/255, blue: 205/255, alpha: 1))
        case .normal:
            return Color(UIColor(displayP3Red: 170/255, green: 170/255, blue: 170/255, alpha: 1))
        case .poison:
            return Color(UIColor(displayP3Red: 99/255, green: 53/255, blue: 156/255, alpha: 1))
        case .psychic:
            return Color(UIColor(displayP3Red: 199/255, green: 103/255, blue: 188/255, alpha: 1))
        case .rock:
            return Color(UIColor(displayP3Red: 161/255, green: 160/255, blue: 159/255, alpha: 1))
        case .steel:
            return Color(UIColor(displayP3Red: 140/255, green: 140/255, blue: 140/255, alpha: 1))
        case .water:
            return Color(UIColor(displayP3Red: 0/255, green: 0/255, blue: 240/255, alpha: 1))
        }
    }

    static func getType(pkmnType: String) -> PDPokemonType {
        let pkmnType: String = pkmnType.lowercased()
        switch pkmnType {
        case "bug":
            return .bug
        case "dark":
            return .dark
        case "dragon":
            return .dragon
        case "electric":
            return .electric
        case "fairy":
            return .fairy
        case "fighting":
            return .fighting
        case "fire":
            return .fire
        case "flying":
            return .flying
        case "ghost":
            return .ghost
        case "grass":
            return .grass
        case "ground":
            return .ground
        case "ice":
            return .ice
        case "poison":
            return .poison
        case "psychic":
            return .psychic
        case "rock":
            return .rock
        case "steel":
            return .steel
        case "water":
            return .water
        default:
            return .normal
        }
    }

    func getBackgroundColor() -> Color {
        switch self {
        case .bug:
            return Color(UIColor(displayP3Red: 255/255, green: 255/255, blue: 210/255, alpha: 1))
        case .dark:
            return Color(UIColor(displayP3Red: 255/255, green: 230/255, blue: 200/255, alpha: 1))
        case .dragon:
            return Color(UIColor(displayP3Red: 255/255, green: 210/255, blue: 255/255, alpha: 1))
        case .electric:
            return Color(UIColor(displayP3Red: 255/255, green: 255/255, blue: 230/255, alpha: 1))
        case .fairy:
            return Color(UIColor(displayP3Red: 255/255, green: 200/255, blue: 255/255, alpha: 1))
        case .fighting:
            return Color(UIColor(displayP3Red: 255/255, green: 230/255, blue: 230/255, alpha: 1))
        case .fire:
            return Color(UIColor(displayP3Red: 255/255, green: 230/255, blue: 230/255, alpha: 1))
        case .flying:
            return Color(UIColor(displayP3Red: 255/255, green: 230/255, blue: 230/255, alpha: 1))
        case .ghost:
            return Color(UIColor(displayP3Red: 255/255, green: 200/255, blue: 255/255, alpha: 1))
        case .grass:
            return Color(UIColor(displayP3Red: 230/255, green: 255/255, blue: 230/255, alpha: 1))
        case .ground:
            return Color(UIColor(displayP3Red: 170/255, green: 150/255, blue: 130/255, alpha: 1))
        case .ice:
            return Color(UIColor(displayP3Red: 210/255, green: 255/255, blue: 255/255, alpha: 1))
        case .normal:
            return Color(UIColor(displayP3Red: 230/255, green: 230/255, blue: 230/255, alpha: 1))
        case .poison:
            return Color(UIColor(displayP3Red: 255/255, green: 200/255, blue: 255/255, alpha: 1))
        case .psychic:
            return Color(UIColor(displayP3Red: 255/255, green: 200/255, blue: 255/255, alpha: 1))
        case .rock:
            return Color(UIColor(displayP3Red: 150/255, green: 150/255, blue: 150/255, alpha: 1))
        case .steel:
            return Color(UIColor(displayP3Red: 200/255, green: 200/255, blue: 200/255, alpha: 1))
        case .water:
            return Color(UIColor(displayP3Red: 230/255, green: 230/255, blue: 255/255, alpha: 1))
        }
    }

    func getMoveColor() -> Color {
        switch self {
        case .bug:
            return Color(UIColor(displayP3Red: 105/255, green: 128/255, blue: 10/255, alpha: 1))
        case .dark:
            return Color(UIColor(displayP3Red: 115/255, green: 65/255, blue: 20/255, alpha: 1))
        case .dragon:
            return Color(UIColor(displayP3Red: 111/255, green: 43/255, blue: 167/255, alpha: 1))
        case .electric:
            return Color(UIColor(displayP3Red: 185/255, green: 160/255, blue: 0/255, alpha: 1))
        case .fairy:
            return Color(UIColor(displayP3Red: 159/255, green: 63/255, blue: 148/255, alpha: 1))
        case .fighting:
            return Color(UIColor(displayP3Red: 159/255, green: 28/255, blue: 30/255, alpha: 1))
        case .fire:
            return Color(UIColor(displayP3Red: 215/255, green: 0/255, blue: 0/255, alpha: 1))
        case .flying:
            return Color(UIColor(displayP3Red: 133/255, green: 95/255, blue: 45/255, alpha: 1))
        case .ghost:
            return Color(UIColor(displayP3Red: 133/255, green: 100/255, blue: 190/255, alpha: 1))
        case .grass:
            return Color(UIColor(displayP3Red: 00/255, green: 180/255, blue: 00/255, alpha: 1))
        case .ground:
            return Color(UIColor(displayP3Red: 160/255, green: 80/255, blue: 20/255, alpha: 1))
        case .ice:
            return Color(UIColor(displayP3Red: 100/255, green: 225/255, blue: 205/255, alpha: 1))
        case .normal:
            return Color(UIColor(displayP3Red: 170/255, green: 170/255, blue: 170/255, alpha: 1))
        case .poison:
            return Color(UIColor(displayP3Red: 99/255, green: 53/255, blue: 156/255, alpha: 1))
        case .psychic:
            return Color(UIColor(displayP3Red: 159/255, green: 63/255, blue: 148/255, alpha: 1))
        case .rock:
            return Color(UIColor(displayP3Red: 120/255, green: 120/255, blue: 120/255, alpha: 1))
        case .steel:
            return Color(UIColor(displayP3Red: 100/255, green: 100/255, blue: 100/255, alpha: 1))
        case .water:
            return Color(UIColor(displayP3Red: 0/255, green: 0/255, blue: 200/255, alpha: 1))
        }
    }

}
