//
//  PDPokemonCardDetailsView.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import SwiftUI

struct PDPokemonCardDetailsView: View {

    @ObservedObject var viewModel: PDPokemonCardDetailsViewModel

    var body: some View {
        ZStack {
            if let type2: PDPokemonType = viewModel.type2 {
                LinearGradient(colors: [viewModel.type1.getBackgroundColor(), type2.getBackgroundColor()], startPoint: .bottomLeading, endPoint: .topTrailing)
            } else {
                viewModel.type1.getBackgroundColor()
            }
            ScrollView {
                VStack {
                    HStack {
                        Text(viewModel.type1.rawValue.uppercased())
                            .bold()
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .frame(width: 100, alignment: .center)
                            .padding(3)
                            .background(viewModel.type1.getColor())
                            .cornerRadius(5)
                            .shadow(radius: 10)
                            .padding()
                        if let type2: PDPokemonType = viewModel.type2 {
                            Text(type2.rawValue.uppercased())
                                .bold()
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .frame(width: 100, alignment: .center)
                                .padding(3)
                                .background(type2.getColor())
                                .cornerRadius(5)
                                .shadow(radius: 5)
                                .padding()
                        }
                    }
                    .padding(.top)
                    if let url: URL = .init(string: viewModel.imageURL) {
                        PDAsyncImageView(url: url)
                    }
                    PDDescriptionView(description: viewModel.pkmnDescription)
                    Button {
                        viewModel.listenDescription()
                    } label: {
                        HStack {
                            Text("LISTEN")
                            Image(systemName: "ear.and.waveform")
                        }
                        .padding(3)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    }
                    Divider()
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                    Text("Moves")
                        .bold()
                        .font(.system(size: 20))
                    ForEach(viewModel.moves, id: \.self) { moves in
                        if let type2: PDPokemonType = viewModel.type2 {
                            ZStack {
                                LinearGradient(colors: [viewModel.type1.getMoveColor(), type2.getMoveColor()],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                                Text(moves)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: 30, alignment: .center)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                        } else {
                            Text(moves)
                                .font(.system(size: 18))
                                .frame(width: UIScreen.main.bounds.width * 0.7, height: 30, alignment: .center)
                                .background(viewModel.type1.getMoveColor())
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .shadow(radius: 5)
                        }
                    }
                    Text("").frame(height: 30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.requestPokemonDescription(pkmnId: viewModel.pkmnId)
        }
    }

}
