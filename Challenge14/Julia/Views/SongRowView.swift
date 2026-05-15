//  SongRowView.swift
//  Challenge14
//  Created by Júlia Clovandi Vasconcelos  on 14/05/26.

// Uma linha da lista de músicas. Recebe um Song e mostra: indicador de reprodução + título + artista + botão de opções.

import SwiftUI

struct SongRowView: View {

    // MARK: - Dynamic Type

    @ScaledMetric(relativeTo: .body) private var titleSize: CGFloat = 19

    // MARK: - Properties

    let song: Song

    // MARK: - Body

    var body: some View {
        HStack(spacing: 12) {
            playingIndicator

            VStack(alignment: .leading, spacing: 4) {
                // Título: verde se tocando, branco se não
                Text(song.title)
                    .font(.system(size: titleSize, weight: .regular))
                    .foregroundStyle(song.isPlaying ? .green : .white)
                    .lineLimit(1)
                    .truncationMode(.tail)

                HStack(spacing: 6) {
                    if song.isDownloaded {
                        Image(systemName: "arrow.down.circle.fill")
                            .font(.caption)
                            .foregroundStyle(.green)
                    }

                    Text(song.artist)
                        .font(.body)
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                }
            }

            Spacer()

            Button {
                print("More tapped for: \(song.title)")
            } label: {
                Image(systemName: "ellipsis")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .contentShape(Rectangle())
            }
            .frame(minWidth: 44, minHeight: 44)
            .accessibilityLabel("Mais opções para \(song.title)")
            .accessibilityHint("Toque duas vezes para ver opções da música")
        }
        // VoiceOver lê tudo como um bloco só, em vez de item por item
        .accessibilityElement(children: .combine)
        .accessibilityLabel(
            "\(song.title), \(song.artist)\(song.isDownloaded ? ", baixada" : "")\(song.isPlaying ? ", tocando agora" : "")"
        )
    }

    // MARK: - Playing Indicator

    // Mostra barras de equalizer verdes se tocando, ou um espaço vazio para manter o alinhamento.
    @ViewBuilder
    private var playingIndicator: some View {
        if song.isPlaying {
            Image(systemName: "chart.bar.fill")
                .foregroundStyle(.green)
                .frame(width: 20)
        } else {
            Color.clear
                .frame(width: 20)
        }
    }
}
