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
    let sharedFavoriteContainer = Self.favoritesContainer()
    
    var body: some Scene{
        WindowGroup {
            PresentationView()
        }
        .modelContainer(sharedFavoriteContainer)
    }
    
    static private func favoritesContainer() -> ModelContainer {
        do {
            return try ModelContainer(for: FavoriteArtwork.self)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
