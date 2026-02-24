//
//  OpenGalleryApp.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/13/26.
//

import SwiftUI
import SwiftData

@main
struct OpenGallery: App {
    var body: some Scene{
        WindowGroup {
            PresentationView()
        }
        .modelContainer(for: FavoriteArtwork.self)
    }
}
