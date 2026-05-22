//
//  FilterPill.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 22/05/26.
//

import SwiftUI

struct FilterPill: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color(.darkGray).opacity(0.4))
            )
        // 2. Usa Capsule no overlay para a borda acompanhar o formato correto
            .overlay(
                Capsule()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}

#Preview {
    FilterPill(text: "Playlist")
}
