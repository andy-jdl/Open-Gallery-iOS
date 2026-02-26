//
//  PresentationView.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/13/26.
//

import Foundation
import SwiftUI

struct PresentationView: View {
    
    // Place holder for now
    @State var artworks: [Artwork] = [
        Artwork(id: "342545",
                title: "Christ Healing the Paralytic",
                artist: "Johannes Wierix, Gerard van Groeningen, Gerard de Jode",
                imageURL: URL(string:"https://nrs.harvard.edu/urn-3:HUAM:770258")!
               ),
        Artwork(
            id: "6236",
            title: "Study for New York Movie",
            artist: "Edward Hopper",
            imageURL: URL(string: "https://whitneymedia.org/assets/artwork/6236/70_276_cropped.jpg")!
        ),
        Artwork(
            id: "23968",
            title: "Nude under a Pine Tree",
            artist: "Pablo Picasso",
            imageURL: URL(string: "https://www.artic.edu/iiif/2/b7b7ecd0-5a50-b89a-c72a-d435a1957c73/full/600,/0/default.jpg")!
        )
    ]
    
    
    @State private var showFavorites: Bool = false
    
    var body: some View {
        NavigationStack {
            TabView {
                ForEach(artworks) { artwork in
                    NavigationLink(value: artwork) {
                        ArtworkCardView(artwork: artwork)
                            .padding(.horizontal, 16)
                    }
                    .buttonStyle(.plain)
                    
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .navigationTitle("Open Gallery")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Artwork.self) { artwork in ArtworkDetailView(artwork: artwork)
            }
            .navigationDestination(isPresented: $showFavorites){
                FavoriteView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showFavorites = true
                    } label : {
                        Image(systemName: "heart.fill").foregroundColor(.red)
                    }
                }
            }
        }
    }
}

#Preview {
    PresentationView()
}
