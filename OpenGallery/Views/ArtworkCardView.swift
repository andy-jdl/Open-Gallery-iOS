//
//  ArtworkCardView.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/18/26.
//

import Foundation
import SwiftUI

struct ArtworkCardView: View {
    var artwork: Artwork
    
    var body: some View {
        VStack {
            AsyncImage(url: artwork.imageURL) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Text(artwork.title).font(.headline)
            Text(artwork.artist).font(.subheadline)

        }
        .padding()
        .background(Color(.systemBackground).opacity(0.95))
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
