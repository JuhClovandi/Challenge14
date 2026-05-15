//  Song.swift
//  Challenge14
//  Created by Júlia Clovandi Vasconcelos on 14/05/26.

import Foundation

// Modelo que representa uma música do álbum.
struct Song: Identifiable {
    
    let id = UUID()
    let title: String
    let artist: String
    let isPlaying: Bool
    let isDownloaded: Bool
}
