//
//  Library.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 22/05/26.
//

import Foundation

enum itemType{
    case playlist, podcast, artist, song
}

struct Library: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let type: itemType
    let isPinned: Bool
}

let mockLibrary: [Library] = [
    Library(title: "Liked Songs", subtitle: "Playlist • 58 songs", imageName: "Liked", type: .playlist, isPinned: true),
    Library(title: "New Episodes", subtitle: "Updated 2 days ago", imageName: "New", type: .podcast, isPinned: true),
    Library(title: "Drake", subtitle: "Artist", imageName: "drake", type: .artist, isPinned: false),
    Library(title: "Lana Del Rey", subtitle: "Artist", imageName: "lana", type: .artist, isPinned: false),
    Library(title: "Matue", subtitle: "Playlist • Spotify", imageName: "albumMatue", type: .playlist, isPinned: false),
    Library(title: "Billie Eilish", subtitle: "Artist", imageName: "billie", type: .artist, isPinned: false),
    Library(title: "Kanye", subtitle: "Song • Runaway", imageName: "kanye", type: .artist, isPinned: false)
]
