//
//  ArtworkDetailView.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/18/26.
//

import Foundation
import SwiftUI

struct ArtworkDetailView: View {
    var artwork: Artwork
    
    var body: some View {
        VStack(spacing:20) {
            AsyncImage(url: artwork.imageURL) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }.frame(maxHeight: 400)
            Text(artwork.title).font(.headline).bold()
            Text(artwork.artist).font(.subheadline).foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .navigationBarTitleDisplayMode(.inline)
    }
}
