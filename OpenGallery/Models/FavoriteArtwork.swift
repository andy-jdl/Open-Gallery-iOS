//
//  FavoriteArtwork.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/23/26.
//

import Foundation
import SwiftData

@Model
class FavoriteArtwork {
    var id: String
    var title: String
    var artist: String
    var imageURL: URL
    var notes: String? = nil
    var tags: [String]? = []
    
    init(id: String, title: String, artist: String, imageURL: URL) {
        self.id = id
        self.title = title
        self.artist = artist
        self.imageURL = imageURL
    }
}

extension FavoriteArtwork {
    convenience init(artwork: Artwork) {
        self.init(
            id: artwork.id,
            title: artwork.title,
            artist: artwork.artist,
            imageURL: artwork.imageURL
        )
    }
}
