//
//  Artwork.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/13/26.
//

import Foundation

// Minimal necessary
struct Artwork: Identifiable, Hashable {
    var id: String
    var title: String
    var artist: String
    var imageURL: URL
}
