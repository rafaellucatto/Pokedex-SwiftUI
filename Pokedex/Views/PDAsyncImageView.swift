//
//  PDAsyncImageView.swift
//  Pokedex
//
//  Created by Rafael Lucatto on 1/19/23.
//

import Foundation
import SwiftUI

struct PDAsyncImageView: View {

    let url: URL

    private let uniqueSize: CGFloat = UIScreen.main.bounds.width * 0.7

    var body: some View {
        return AsyncImage(url: url, content: { image in
            image
                .resizable()
                .frame(width: uniqueSize,
                       height: uniqueSize,
                       alignment: .center)
                .background(Color.myLightGray)
                .cornerRadius(10)
                .shadow(radius: 15)
                .padding()
        }, placeholder: {
            ProgressView()
                .frame(width: uniqueSize,
                       height: uniqueSize,
                       alignment: .center)
        })
    }

}

