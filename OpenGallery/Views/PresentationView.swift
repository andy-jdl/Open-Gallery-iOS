//
//  PresentationView.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/13/26.
//

import Foundation
import SwiftUI

struct PresentationView: View {
    
    @State private var artwork: Artwork = Artwork(
        id: 123,
        title: "(Archie)", 
        artist: "Andy Warhol", 
        imageURL: URL(string: "https://whitneymedia.org/assets/artwork/45463/2014_29_185_cropped.jpg")!
    )
    
    
    
    var body: some View {
        // Need a stack
        // Set the colors to a warm gallery
        // Stack your elements
        // Ignore safe guard ares?
        
        // AsyncImage
        ZStack{
            Text("Hello world")
        }

    }
}
