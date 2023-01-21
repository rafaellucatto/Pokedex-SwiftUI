//
//  PDSelectedGeneration.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/20/23.
//

import Foundation
import SwiftUI

enum PDSelectedGeneration {

    case gen1
    case gen2
    case gen3
    case gen4

    var getURL: String {
        switch self {
        case .gen1:
            return K.Url.gen1
        case .gen2:
            return K.Url.gen2
        case .gen3:
            return K.Url.gen3
        case .gen4:
            return K.Url.gen4
        }
    }

    var getBackgroundColor: Color {
        switch self {
        case .gen1:
            return .gen1
        case .gen2:
            return .gen2
        case .gen3:
            return .gen3
        case .gen4:
            return .gen4
        }
    }

}
