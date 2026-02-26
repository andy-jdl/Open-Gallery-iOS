//
//  Artwork.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/13/26.
//

import Foundation

// Minimal necessary
struct Artwork: Identifiable, Codable, Hashable {
    var id: String
    var title: String
    var artist: String
    var imageURL: URL
}

extension Artwork {
    init(from favorite: FavoriteArtwork) {
        self.id = favorite.id
        self.title = favorite.title
        self.artist = favorite.artist
        self.imageURL = favorite.imageURL
    }
}
