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
    var tags: [String] = []
    
    init(id: String, title: String, artist: String, imageURL: URL, notes: String? = nil, tags: [String] = []) {
        self.id = id
        self.title = title
        self.artist = artist
        self.imageURL = imageURL
        self.notes = notes
        self.tags = tags
    }
}
