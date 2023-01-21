//
//  PDMainView.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import SwiftUI

struct PDMainView<PDMainViewModelExtra>: View where PDMainViewModelExtra: PDMainViewModelProtocol {

    private let pokemonGrid: [GridItem] = [.init(.adaptive(minimum: UIScreen.main.bounds.width * 0.4,
                                                   maximum: UIScreen.main.bounds.width * 0.5),
                                         spacing: 0,
                                         alignment: .center)]

    @ObservedObject var viewModel: PDMainViewModelExtra

    var body: some View {
        NavigationView {
            ScrollViewReader { scroll in
                VStack {
                    if !viewModel.pokemonCards.isEmpty {
                        ScrollView {
                            LazyVGrid(columns: pokemonGrid) {
                                EmptyView().id("TOP_ID")
                                ForEach(viewModel.pokemonCards) { card in
                                    if viewModel.pokemonNameSearch == "" {
                                        NavigationLink {
                                            let viewModel: PDPokemonCardDetailsViewModel = .init(pokemonCard: card)
                                            PDPokemonCardDetailsView(viewModel: viewModel)
                                        } label: {
                                            let viewModel: PDPokemonCardViewModel = .init(pokemonCard: card)
                                            PDPokemonCardView(viewModel: viewModel)
                                        }
                                    } else {
                                        if card.name.lowercased().contains(viewModel.pokemonNameSearch.lowercased()) {
                                            NavigationLink {
                                                let viewModel: PDPokemonCardDetailsViewModel = .init(pokemonCard: card)
                                                PDPokemonCardDetailsView(viewModel: viewModel)
                                            } label: {
                                                let viewModel: PDPokemonCardViewModel = .init(pokemonCard: card)
                                                PDPokemonCardView(viewModel: viewModel)
                                            }
                                        }
                                    }
                                }
                                EmptyView().id("BOTTOM_ID")
                                .onChange(of: viewModel.pokemonCards) { newValue in
                                    viewModel.pokemonCards = viewModel.pokemonCards.sorted { pokemonCard1, pokemonCard2 in
                                        return pokemonCard1.pkmnId < pokemonCard2.pkmnId
                                    }
                                }
                            }
                        }
                    } else {
                        PDPokemonLoadingView()
                    }
                }
                .background(viewModel.backgroundColor)
                .navigationTitle("Pokédex")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button {
                                viewModel.didPressGen1()
                            } label: {
                                HStack {
                                    Text("1st Gen")
                                    Image(systemName: "bolt.horizontal.circle")
                                }
                            }
                            Button {
                                viewModel.didPressGen2()
                            } label: {
                                HStack {
                                    Text("2nd Gen")
                                    Image(systemName: "snowflake.circle")
                                }
                            }
                            Button {
                                viewModel.didPressGen3()
                            } label: {
                                HStack {
                                    Text("3rd Gen")
                                    Image(systemName: "leaf.circle")
                                }
                            }
                            Button {
                                viewModel.didPressGen4()
                            } label: {
                                HStack {
                                    Text("4th Gen")
                                    Image(systemName: "circle.hexagongrid.circle")
                                }
                            }
                            Button {
                                withAnimation {
                                    scroll.scrollTo("TOP_ID")
                                }
                            } label: {
                                HStack {
                                    Text("Top of the page")
                                    Image(systemName: "arrow.up.circle")
                                }
                            }
                            Button {
                                withAnimation {
                                    scroll.scrollTo("BOTTOM_ID")
                                }
                            } label: {
                                HStack {
                                    Text("Bottom of the page")
                                    Image(systemName: "arrow.down.circle")
                                }
                                
                            }
                        } label: {
                            HStack {
                                Image(systemName: "list.triangle")
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchPokemon(for: .gen1)
        }
        .searchable(text: $viewModel.pokemonNameSearch)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PDMainView(viewModel: PDMainViewModel())
    }
}
