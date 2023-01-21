//
//  PDDescriptionView.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation
import SwiftUI

struct PDDescriptionView: View {

    var description: String

    var body: some View {
        Text(description)
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .center)
            .multilineTextAlignment(.leading)
            .padding(3)
            .background(Color.myLightGray)
            .cornerRadius(12)
            .clipped()
            .shadow(radius: 10)
    }

}
