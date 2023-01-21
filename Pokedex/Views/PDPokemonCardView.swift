//
//  PDPokemonCardView.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import SwiftUI

struct PDPokemonCardView: View {

    let viewModel: PDPokemonCardViewModel

    var body: some View {
        if viewModel.hasTwoTypes {
            ZStack {
                VStack {
                    Spacer()
                    Text(viewModel.name)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                }
                VStack {
                    HStack {
                        Text(viewModel.id)
                            .bold()
                            .foregroundColor(.white)
                            .padding([.leading, .top], 6)
                        Spacer()
                    }
                    Spacer()
                }
                AsyncImage(url: URL(string: viewModel.imageURL), content: { image in
                    image.resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.25,
                               height: UIScreen.main.bounds.width * 0.25,
                               alignment: .center)
                }, placeholder: {
                    ProgressView()}
                )
            }
            .frame(width: K.Card.width, height: K.Card.height)
            .background(
                LinearGradient(colors: [viewModel.bgColor1, viewModel.bgColor2!],
                               startPoint: .bottomLeading,
                               endPoint: .topTrailing)
            )
            .cornerRadius(10)
            .clipped()
            .shadow(color: Color.black, radius: 5)
        } else {
            ZStack {
                VStack {
                    Spacer()
                    Text(viewModel.name)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                }
                VStack {
                    HStack {
                        Text(viewModel.id)
                            .bold()
                            .foregroundColor(.white)
                            .padding([.leading, .top], 6)
                        Spacer()
                    }
                    Spacer()
                }
                AsyncImage(url: URL(string: viewModel.imageURL), content: { image in
                    image.resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.25,
                               height: UIScreen.main.bounds.width * 0.25,
                               alignment: .center)
                }, placeholder: {
                    ProgressView()}
                )
            }
            .frame(width: K.Card.width, height: K.Card.height)
            .background(viewModel.bgColor1)
            .cornerRadius(10)
            .clipped()
            .shadow(color: Color.black, radius: 5)
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PDPokemonCardView(viewModel: .init(pokemonCard: .stub()))
    }
}
