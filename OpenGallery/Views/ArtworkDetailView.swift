//
//  ArtworkDetailView.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/18/26.
//

import Foundation
import SwiftUI
import SwiftData

struct ArtworkDetailView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var isFavorited: Bool = false

    var artwork: Artwork
    
    var body: some View {
        
        
        VStack(spacing:20) {
            AsyncImage(url: artwork.imageURL) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }.frame(maxHeight: 400)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(artwork.title).font(.title).bold()
                    FavoriteButton(isSet: $isFavorited)
                }
                HStack {
                    Text(artwork.artist).font(.subheadline).foregroundColor(.secondary)
                }

            }
            
        }
        .padding()
        .background(Color(.systemBackground))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    // fix bottom artist name kinda ugly
    // switch to scrollview (re-org)
    let artwork = Artwork(id: "aic:456",  title: "Dish with Undulating Peony-Leaf Scrolls", artist: "An actual artist", imageURL: URL(string: "https://www.artic.edu/iiif/2/1f2e3249-c4ba-4e06-092f-e364972a2aa3/full/600,/0/default.jpg")!
    )
    return ArtworkDetailView(artwork: artwork).modelContainer(for: FavoriteArtwork.self)
}
