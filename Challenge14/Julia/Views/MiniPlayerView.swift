//  MiniPlayerView.swift
//  Challenge14
//  Created by Júlia Clovandi Vasconcelos  on 14/05/26.

// Mini player fixo na parte inferior da tela (iPhone).
// Mostra: thumbnail + título + indicador de dispositivo + botão pause + barra de progresso.

import SwiftUI

struct MiniPlayerView: View {

    // MARK: - Dynamic Type

    @ScaledMetric(relativeTo: .subheadline) private var titleSize: CGFloat = 15

    // MARK: - Layout

    private enum Layout {
        static let thumbnailSize: CGFloat = 46
        static let cornerRadius: CGFloat = 8
        static let containerCornerRadius: CGFloat = 12
        static let horizontalPadding: CGFloat = 12
        static let verticalPadding: CGFloat = 6
        static let progressPadding: CGFloat = 20
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {

                Image("album_cover")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: Layout.thumbnailSize,
                        height: Layout.thumbnailSize
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: Layout.cornerRadius)
                    )

                VStack(alignment: .leading, spacing: 4) {
                    Text("From Me to You - Mono /...")
                        .font(.system(size: titleSize, weight: .semibold))
                        .foregroundStyle(.white)
                        .lineLimit(1)

                    HStack(spacing: 4) {
                        Image(systemName: "sparkles")
                        Text("BEATSPILL+")
                    }
                    .font(.caption)
                    .foregroundStyle(.green)
                }

                Spacer()

                Image(systemName: "hifispeaker.fill")
                    .font(.title3)
                    .foregroundStyle(.green)

                Button {
                    print("Mini player pause tapped")
                } label: {
                    Image(systemName: "pause.fill")
                        .font(.title2)
                        .foregroundStyle(.white)
                }
                .frame(minWidth: 44, minHeight: 44)
                .accessibilityLabel("Pausar")
                .accessibilityHint("Toque duas vezes para pausar a reprodução")
            }
            .padding(.horizontal, Layout.horizontalPadding)
            .padding(.vertical, Layout.verticalPadding)
            .background(
                Color(red: 0.27, green: 0.05, blue: 0.09)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: Layout.containerCornerRadius)
            )
            .padding(.horizontal, 8)

            // Barra de progresso com 55% da música tocada 
            ProgressView(value: 0.55)
                .progressViewStyle(.linear)
                .tint(.blue)
                .padding(.horizontal, Layout.progressPadding)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Tocando agora: From Me to You dos Beatles, 55% concluído")
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        VStack {
            Spacer()
            MiniPlayerView()
        }
    }
}
