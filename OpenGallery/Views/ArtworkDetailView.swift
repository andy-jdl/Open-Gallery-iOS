//
//  ArtworkDetailView.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/18/26.
//

import Foundation
import SwiftUI
import SwiftData

struct ArtworkDetailView: View {
    @Environment(\.modelContext) private var context
    @Query private var favorites: [FavoriteArtwork]
    @State private var notes: String = ""
    var artwork: Artwork
    
    let description = "For many artists living amid the destruction and rebuilding of postwar Europe, artworks of the past offered a sense of continuity and order. For this work, Pablo Picasso looked to the long tradition of figurative painting, including the female nudes of Francisco de Goya. In contrast to his predecessors, however, Picasso placed the figure on rocky terrain rather than on a plush chaise and used multiple viewpoints that recall his Cubist works."
    let museum = "Art Institute of Chicago"
    
    var body: some View {
        ScrollView {
            
            AsyncImage(url: artwork.imageURL) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                HStack{
                    Text(artwork.title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    FavoriteButton(
                        isSet: Binding(
                            get: { isFavorited },
                            set: toggleFavorite
                        )
                    )
                }
                
                HStack{
                    Text(artwork.artist)
                    Spacer()
                    Text(museum)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text(description).font(.title2).padding()
                if !isFavorited{
                    VStack {
                        Text("Add to Favorites to write notes").font(.footnote).foregroundStyle(.secondary)
                        Spacer()
                    }.frame(maxWidth: .infinity)

                } else {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Notes").bold()
                        TextEditor(text: $notes) .font(.custom("HelveticaNeue", size: 16))
                            .frame(height: 120)
                            .padding(4)
                            .background(Color(UIColor.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                            .onTapGesture {}
                    }.padding(.horizontal)
                        .onTapGesture{ hideKeyboardAndSave() }
                }
            }
        }
        .navigationTitle(artwork.title)
        .navigationBarTitleDisplayMode(.inline)

    }
    
    private var isFavorited: Bool {
        favorites.contains(where: { $0.id == artwork.id})
    }
    
    private func toggleFavorite(_ isNewFavorite: Bool) {
        if isNewFavorite {
            context.insert(FavoriteArtwork(artwork: artwork))
        } else if let exists = favorites.first(where: { $0.id == artwork.id}){
            context.delete(exists)
        }
    }
    
    private func hideKeyboardAndSave() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        Save()
    }
    
    private func Save() {
        // TODO
    }
}

#Preview {
    // fix bottom artist name kinda ugly
    // switch to scrollview (re-org)
    let artwork = Artwork(id: "23968",
      title: "Nude under a Pine Tree",
      artist: "Pablo Picasso",
      imageURL: URL(string: "https://openaccess-cdn.clevelandart.org/1921.1174/1921.1174_web.jpg")!
    )
    return ArtworkDetailView(artwork: artwork).modelContainer(for: FavoriteArtwork.self)
}
