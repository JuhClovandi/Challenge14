//
//  LibraryView.swift
//  Challenge14
//
//  Created by Gustavo Souto Pereira on 22/05/26.
//

import Foundation
import SwiftUI

struct LibraryView: View {
    let items: [Library] = mockLibrary
    @ScaledMetric(relativeTo: .title) private var profileImageSize: CGFloat = 35
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                
                // header
                HStack(spacing: 16){
                    Image(systemName: "person.circle.fill") // Substitua pela foto do usuário
                        .resizable()
                        .scaledToFill()
                        .frame(width: profileImageSize, height: profileImageSize)
                        .foregroundColor(.gray)
                    
                    Text("Your Library")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .minimumScaleFactor(0.75)
                    
                    Spacer()
                    
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                }.padding(.horizontal)
                
                // filtros
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        FilterPill(text: "Playlists")
                        FilterPill(text: "Artists")
                        FilterPill(text: "Albums")
                        FilterPill(text: "Podcasts & Shows")
                    }
                    .padding(.horizontal)
                }
                
                // 3. SUB-HEADER
                HStack {
                    Label("Recently played", systemImage: "arrow.up.arrow.down")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .minimumScaleFactor(0.75)
                    
                    Spacer()
                    
                    Image(systemName: "square.grid.2x2")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                // 4. LISTA DE ITENS
                VStack(spacing: 16) {
                    ForEach(items) { item in
                        LibraryRow(item: item)
                    }.lineLimit(2)
                        .minimumScaleFactor(0.75)
                }
                .padding(.horizontal)
            }
            .padding(.top, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}



#Preview {
    LibraryView()
}
