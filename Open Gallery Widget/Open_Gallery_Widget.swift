//
//  Open_Gallery_Widget.swift
//  Open Gallery Widget
//
//  Created by Andy De Leon on 2/26/26.
//

import WidgetKit
import SwiftUI


extension View {
    func widgetBackground(backgroundView: some View) -> some View {
        if #available(iOS 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self.resizable().scaledToFill().frame(width: geo.size.width, height: geo.size.height).clipped()
            
        }
    }
}

struct Artwork {
    var imageURL: URL
    var title: String // change this to ID
}

struct ArtworkEntry: TimelineEntry {
    var date: Date
    var artwork: Artwork
}

struct ArtworkProvider: TimelineProvider {
    
    var artWorkFromServer: Artwork
    let artwork = Artwork(imageURL: URL(string: "https://www.artic.edu/iiif/2/e943af1d-4bf3-42a9-54e5-1352b6f9b968/full/600,/0/default.jpg")!, title: "Christ in Limbo")
    
    func placeholder(in context: Context) -> ArtworkEntry {
        ArtworkEntry(date: Date(), artwork: artwork)
    }
    
    // Generates a preiew for the widget Gallery
    func getSnapshot(in context: Context, completion: @escaping (ArtworkEntry) -> Void) {
        let date = Date()
        let entry: ArtworkEntry
        
        // might have to check if its fetched?
        if context.isPreview {
            entry = ArtworkEntry(date: date, artwork: artwork)
        } else {
            entry = ArtworkEntry(date: date, artwork: artWorkFromServer)
        }
        
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ArtworkEntry>) -> Void) {
        // This creates a timeline entry for "now"
        
        let entry = ArtworkEntry(date: Date(), artwork: artwork)
        
        // Creates a daily refresh (once a day)
        let nextUpdateDate = Calendar.current.nextDate(after: Date(), matching: DateComponents(hour:0, minute:0), matchingPolicy: .nextTime)!
        
        let timeline = Timeline(entries:[entry], policy: .after(nextUpdateDate))
        
        // Completion to pass the timeline to widgetkit
        completion(timeline)
    }
}

struct Open_Gallery_WidgetEntryView: View {
    var entry: ArtworkProvider.Entry
    
    var body: some View {
        Group {
            if let data = try? Data(contentsOf: entry.artwork.imageURL),
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .clipped()
            } else {
                Color.gray
            }
        }
        .widgetBackground(backgroundView: Color.clear)
    }
}

struct Open_Gallery_Widget: Widget {
    let artwork = Artwork(imageURL: URL(string: "https://www.artic.edu/iiif/2/e943af1d-4bf3-42a9-54e5-1352b6f9b968/full/600,/0/default.jpg")!, title: "Christ in Limbo")
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.opengallery.widget",
            provider: ArtworkProvider(artWorkFromServer: artwork)
        ) { entry in
            Open_Gallery_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Open Gallery Widget")
        .description("New art everyday!")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    Open_Gallery_Widget()
} timeline: {
    // Fill with data
    let artwork = Artwork(imageURL: URL(string: "https://www.artic.edu/iiif/2/e943af1d-4bf3-42a9-54e5-1352b6f9b968/full/600,/0/default.jpg")!, title: "Christ in Limbo")
    ArtworkEntry(date: .now, artwork: artwork)
}
