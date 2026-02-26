//
//  FavoriteRow.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/24/26.
//

import Foundation
import SwiftUI
import SwiftData


struct FavoriteRow: View {
    var artwork: FavoriteArtwork
    
    var body: some View {
        HStack {
            AsyncImage(url: artwork.imageURL) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }.frame(width: 50, height: 50)
            Text(artwork.title)
                .lineLimit(1)
                .truncationMode(.tail)
                .font(.headline)
                .foregroundStyle(.primary)
            
            Spacer()
            
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
        }
    }
}


#Preview {
    // Create an in-memory container for FavoriteArtwork
    let container = try! ModelContainer(for: FavoriteArtwork.self, configurations: .init(isStoredInMemoryOnly: true))
    let context = container.mainContext
    
    // Insert sample data into context
    let sample1 = FavoriteArtwork(
        id: "1",
        title: "Obsession",
        artist: "Odilon Redon",
        imageURL: URL(string: "https://openaccess-cdn.clevelandart.org/1931.49/1931.49_web.jpg")!
    )
    context.insert(sample1)
    
    let sample2 = FavoriteArtwork(
        id: "2",
        title: "Tri-Lobed Dish",
        artist: "Unknown",
        imageURL: URL(string: "https://www.artic.edu/iiif/2/92836a2a-9764-1ef4-1428-4042834d5b4b/full/600,/0/default.jpg")!
    )
    context.insert(sample2)
    
    // Use modelContainer modifier so SwiftUI preview can access SwiftData
    return VStack {
        FavoriteRow(artwork: sample1)
        FavoriteRow(artwork: sample2)
    }
    .modelContainer(container)
}
