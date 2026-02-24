//
//  PresentationView.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/13/26.
//

import Foundation
import SwiftUI

struct PresentationView: View {
    
    @State private var artworks: [Artwork] = [
        Artwork(id: "wit:123",title: "(Archie)",artist: "Andy Warhol",
        imageURL: URL(string: "https://whitneymedia.org/assets/artwork/45463/2014_29_185_cropped.jpg")!
        ),
        Artwork(id: "aic:123", title: "Tri-Lobed Dish", artist: "Unknown", imageURL: URL(string: "https://www.artic.edu/iiif/2/92836a2a-9764-1ef4-1428-4042834d5b4b/full/600,/0/default.jpg")!
        ),
        Artwork(id: "lve:123", title: "Le Départ de Léonidas", artist: "Couder, Auguste, France", imageURL: URL(string: "https://collections.louvre.fr/media/cache/original/0000000021/0000055264/0000044572_OG.JPG")!
        ),
        Artwork(id: "aic:456",  title: "Dish with Undulating Peony-Leaf Scrolls", artist: "Unknown", imageURL: URL(string: "https://www.artic.edu/iiif/2/1f2e3249-c4ba-4e06-092f-e364972a2aa3/full/600,/0/default.jpg")!
        ),
        Artwork(id: "clv:123", title: "Obsession", artist: "Odilon Redon (French, 1840–1916),Printer: Monrocq", imageURL: URL(string: "https://openaccess-cdn.clevelandart.org/1931.49/1931.49_web.jpg")!
        ),
    ]
    
    
    var body: some View {
        NavigationStack {
            TabView
            {
                ForEach(artworks) { artwork in
                    NavigationLink(value: artwork) {
                        ArtworkCardView(artwork: artwork).padding(.horizontal, 24)
                    }
                    .buttonStyle(.plain)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .navigationTitle("Open Gallery")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Artwork.self) {
                artwork in ArtworkDetailView(artwork: artwork).transition(.opacity)
            }
        }
    }
}
