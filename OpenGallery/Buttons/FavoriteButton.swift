//
//  FavoriteButton.swift
//  OpenGallery
//
//  Created by Andy De Leon on 2/23/26.
//

import Foundation
import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Favorite", systemImage: isSet ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .red : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
