//  AlbumHeaderView.swift
//  Challenge14
//  Created by Júlia Clovandi Vasconcelos  on 14/05/26.

// Cabeçalho da tela do álbum: botão voltar + capa centralizada.
// A capa cresce no iPad para preencher melhor a tela.

import SwiftUI

struct AlbumHeaderView: View {

    // MARK: - Dynamic Type

    // Escala o ícone do botão voltar junto com a preferência de fonte do usuário.
    @ScaledMetric(relativeTo: .title2) private var backButtonSize: CGFloat = 24

    // MARK: - Layout

    private enum Layout {
        static let albumSizeCompact: CGFloat = 230
        static let albumSizeRegular: CGFloat = 320
        static let topSpacing: CGFloat = 22
        static let shadowRadius: CGFloat = 14
    }

    // MARK: - Environment

    /// compact = iPhone, regular = iPad.
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    /// Capa maior no iPad, menor no iPhone.
    private var albumCoverSize: CGFloat {
        horizontalSizeClass == .regular
            ? Layout.albumSizeRegular
            : Layout.albumSizeCompact
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: Layout.topSpacing) {

            HStack {
                Button {
                    print("Back tapped")
                } label: {
                    // chevron.backward espelha sozinho em RTL. chevron.left não faz isso.
                    Image(systemName: "chevron.backward")
                        .font(.system(size: backButtonSize, weight: .regular))
                        .foregroundStyle(.white.opacity(0.85))
                        .contentShape(Rectangle())
                }
                .frame(minWidth: 44, minHeight: 44)
                .accessibilityLabel("Voltar")
                .accessibilityHint("Retorna à tela anterior")

                Spacer()
            }

            Image("album_cover")
                .resizable()
                .scaledToFit()
                .frame(
                    width: albumCoverSize,
                    height: albumCoverSize
                )
                .shadow(radius: Layout.shadowRadius)
                .accessibilityLabel("Capa do álbum 1 Remastered dos Beatles")
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        AlbumHeaderView()
            .padding()
    }
}
