//
//  LibraryRow.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 22/05/26.
//

import SwiftUI

struct LibraryRow: View {
    let item: Library
    @ScaledMetric(relativeTo: .body) private var imageSize: CGFloat = 44
    
    var body: some View {
        HStack(spacing: 16) {
            // Imagem condicional: Redonda para artistas, quadrada para o resto
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: imageSize, height: imageSize)
                .background(Color(.darkGray).opacity(0.3))
                .clipShape(item.type == .artist ? AnyShape(Circle()) : AnyShape(RoundedRectangle(cornerRadius: 4)))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .minimumScaleFactor(0.75)
                
                HStack(spacing: 4) {
                    if item.isPinned {
                        Image(systemName: "pin.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                    
                    Text(item.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .minimumScaleFactor(0.75)
                }
            }
            
            Spacer()
        }
    }
}
