//
//  FavoriteView.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/24/26.
//

import Foundation
import SwiftUI
import SwiftData


// TODO home button
struct FavoriteView: View {
    
    @Query private var favorites: [FavoriteArtwork]
    
    var body: some View {
        VStack {
            ForEach(favorites) { favorite in
                NavigationLink {
                    ArtworkDetailView(artwork: Artwork(from:favorite))
                } label : {
                    FavoriteRow(artwork: favorite)
                }
                .font(.headline)
                .foregroundStyle(.primary)
                .navigationTitle("Favorites")
            }.padding()
            Spacer()
        }

    }
}

// Note to self:
// if you use: Query/SwiftData
// Preview needs: .modelContainer()
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: FavoriteArtwork.self,
        configurations: config
    )
    let context = container.mainContext
    
    let sample1 = FavoriteArtwork(id: "1", title: "Obsession", artist: "Odilon Redon", imageURL: URL(string: "https://openaccess-cdn.clevelandart.org/1931.49/1931.49_web.jpg")!)
    context.insert(sample1)
    
    let sample2 = FavoriteArtwork(id: "2", title: "Tri-Lobed Dish", artist: "Unknown", imageURL: URL(string: "https://www.artic.edu/iiif/2/92836a2a-9764-1ef4-1428-4042834d5b4b/full/600,/0/default.jpg")!)
    context.insert(sample2)
    
    return FavoriteView()
        .modelContainer(container)
}
