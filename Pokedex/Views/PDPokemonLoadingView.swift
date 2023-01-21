//
//  PDPokemonLoadingView.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import SwiftUI

struct PDPokemonLoadingView: View {

    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.circular)
            Text("Loading...")
        }
    }

}

struct UnableToLoadErrorView_Previews: PreviewProvider {
    static var previews: some View {
        PDPokemonLoadingView()
    }
}
