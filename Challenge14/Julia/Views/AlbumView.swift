//  AlbumView.swift
//  Challenge14
//  Created by Júlia Clovandi Vasconcelos  on 14/05/26.

// View raiz da tela de detalhes do álbum. Hospedada dentro do UIKit via UIHostingController.
/// Se adapta a 3 cenários:
/// - iPhone (compact): coluna vertical + mini player + tab bar
/// - iPad Portrait (regular): conteúdo scrollável + Now Playing compacto + tab bar
/// - iPad Landscape (regular): duas colunas (40% álbum + 55% Now Playing)
// Em RTL, HStacks e VStacks espelham automaticamente.
// Os controles de música ficam fixos em LTR (padrão da indústria).

import SwiftUI

struct AlbumView: View {

    // MARK: - Dynamic Type

    /// @ScaledMetric em vez de Text Styles diretos permite preservar os tamanhos originais do design no modo padrão e só escalar quando o usuário ativa fontes maiores.
    @ScaledMetric(relativeTo: .largeTitle) private var albumTitleSize: CGFloat = 32
    @ScaledMetric(relativeTo: .title2) private var nowPlayingTitleSize: CGFloat = 22
    @ScaledMetric(relativeTo: .title2) private var backButtonSize: CGFloat = 24
    @ScaledMetric(relativeTo: .title2) private var playButtonIconSize: CGFloat = 22
    @ScaledMetric(relativeTo: .body) private var headerIconSize: CGFloat = 20
    @ScaledMetric(relativeTo: .subheadline) private var headerTitleSize: CGFloat = 15
    @ScaledMetric(relativeTo: .subheadline) private var subtitleSize: CGFloat = 16
    @ScaledMetric(relativeTo: .callout) private var barTitleSize: CGFloat = 14
    @ScaledMetric(relativeTo: .caption) private var deviceTextSize: CGFloat = 13
    @ScaledMetric(relativeTo: .caption) private var timestampSize: CGFloat = 12
    @ScaledMetric(relativeTo: .body) private var controlSize: CGFloat = 26
    @ScaledMetric(relativeTo: .subheadline) private var smallControlSize: CGFloat = 18
    @ScaledMetric(relativeTo: .title) private var pauseButtonSize: CGFloat = 30
    @ScaledMetric(relativeTo: .subheadline) private var barControlSize: CGFloat = 16
    @ScaledMetric(relativeTo: .body) private var barPauseSize: CGFloat = 20
    @ScaledMetric(relativeTo: .subheadline) private var addButtonSize: CGFloat = 24
    @ScaledMetric(relativeTo: .caption) private var barArtistSize: CGFloat = 12
    @ScaledMetric(relativeTo: .callout) private var barDeviceSize: CGFloat = 14

    // MARK: - Environment

    /// compact = iPhone, regular = iPad.
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    // MARK: - Data

    private let songs: [Song] = [
        Song(
            title: "Love Me Do - Mono / Remastered",
            artist: "The Beatles",
            isPlaying: false,
            isDownloaded: true
        ),
        Song(
            title: "From Me to You - Mono / Remastered",
            artist: "The Beatles",
            isPlaying: true,
            isDownloaded: true
        ),
        Song(
            title: "She Loves You - Mono / Remastered",
            artist: "The Beatles",
            isPlaying: false,
            isDownloaded: true
        ),
        Song(
            title: "I Want To Hold Your Hand - Remastered 2015",
            artist: "The Beatles",
            isPlaying: false,
            isDownloaded: true
        )
    ]

    // MARK: - Body

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                backgroundGradient

                if horizontalSizeClass == .regular {
                    iPadLayout(geometry: geometry)
                } else {
                    iPhoneLayout(geometry: geometry)
                }
            }
        }
    }

    // MARK: - iPhone Layout

    // Coluna vertical simples: conteúdo scrollável → mini player → tab bar.
    @ViewBuilder
    private func iPhoneLayout(geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {
                    AlbumHeaderView()
                    albumInfo
                    songList
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 160)
            }

            VStack(spacing: 0) {
                MiniPlayerView()
                TabBarView()
            }
        }
    }

    // Decide entre landscape e portrait no iPad.
    @ViewBuilder
    private func iPadLayout(geometry: GeometryProxy) -> some View {

        let isLandscape = geometry.size.width > geometry.size.height

        if isLandscape {
            iPadLandscapeContent(geometry: geometry)
        } else {
            iPadPortraitContent(geometry: geometry)
        }
    }

    // MARK: - iPad Landscape

    /// Duas colunas: álbum à esquerda + Now Playing à direita.
    @ViewBuilder
    private func iPadLandscapeContent(geometry: GeometryProxy) -> some View {
        HStack(spacing: 0) {

            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 18) {
                        backButton
                            .padding(.top, 8)

                        Image("album_cover")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 320, maxHeight: 320)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(color: .black.opacity(0.4), radius: 16, x: 0, y: 8)
                            .accessibilityLabel("Capa do álbum 1 Remastered dos Beatles")

                        albumInfo
                        songList
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 28)
                    .padding(.bottom, 40)
                }

                TabBarView()
            }
            .frame(width: geometry.size.width * 0.55)
            .background(Color.black.opacity(0.3))

            nowPlayingPanel
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    // MARK: - Now Playing Panel (Landscape)

    // Painel expandido com capa grande, controles completos e indicador de dispositivo.
    private var nowPlayingPanel: some View {
        VStack(spacing: 0) {

            // Header: minimizar + nome do álbum + opções
            HStack {
                Image(systemName: "chevron.down.square")
                    .font(.system(size: headerIconSize))
                    .foregroundStyle(.white.opacity(0.7))
                    .accessibilityLabel("Minimizar player")

                Spacer()

                Text("1(Remastered)")
                    .font(.system(size: headerTitleSize, weight: .semibold))
                    .foregroundStyle(.white)

                Spacer()

                Image(systemName: "ellipsis")
                    .font(.system(size: headerIconSize))
                    .foregroundStyle(.white.opacity(0.7))
                    .accessibilityLabel("Mais opções")
            }
            .padding(.horizontal, 28)
            .padding(.top, 20)

            Spacer()

            // Capa grande (decorativa — já descrita no header)
            Image("album_cover")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 10)
                .accessibilityHidden(true)

            Spacer().frame(height: 28)

            // Título + artista + botão adicionar
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("From Me to You")
                        .font(.system(size: nowPlayingTitleSize, weight: .bold))
                        .foregroundStyle(.white)
                        .lineLimit(1)

                    Text("The Beatles")
                        .font(.system(size: subtitleSize))
                        .foregroundStyle(Color(white: 0.55))
                }
                Spacer()
                Image(systemName: "plus.circle")
                    .font(.system(size: addButtonSize))
                    .foregroundStyle(Color(white: 0.55))
                    .accessibilityLabel("Adicionar música à biblioteca")
            }
            .padding(.horizontal, 28)

            // Slider de progresso + timestamps
            VStack(spacing: 4) {
                Slider(value: .constant(0.55))
                    .tint(.white)
                    .accessibilityLabel("Progresso da música")
                    .accessibilityValue("55 por cento, 1 minuto e 18 segundos")

                HStack {
                    Text("1:18")
                        .font(.system(size: timestampSize))
                        .foregroundStyle(Color(white: 0.45))
                    Spacer()
                    Text("-2:14")
                        .font(.system(size: timestampSize))
                        .foregroundStyle(Color(white: 0.45))
                }
            }
            .padding(.horizontal, 28)
            .padding(.top, 16)

            // Controles (fixos em LTR — padrão da indústria para players de música)
            HStack(spacing: 36) {
                Image(systemName: "shuffle")
                    .font(.system(size: smallControlSize))
                    .foregroundStyle(Color(white: 0.55))
                    .accessibilityLabel("Aleatório")

                Image(systemName: "backward.end.fill")
                    .font(.system(size: controlSize))
                    .foregroundStyle(.white)
                    .accessibilityLabel("Música anterior")

                Button { print("Play/Pause") } label: {
                    Image(systemName: "pause.fill")
                        .font(.system(size: pauseButtonSize))
                        .foregroundStyle(.black)
                        .frame(width: 64, height: 64)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .accessibilityLabel("Pausar")
                .accessibilityHint("Toque duas vezes para pausar a reprodução")

                Image(systemName: "forward.end.fill")
                    .font(.system(size: controlSize))
                    .foregroundStyle(.white)
                    .accessibilityLabel("Próxima música")

                Image(systemName: "repeat")
                    .font(.system(size: smallControlSize))
                    .foregroundStyle(Color(white: 0.55))
                    .accessibilityLabel("Repetir")
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
            .environment(\.layoutDirection, .leftToRight)

            HStack(spacing: 6) {
                Image(systemName: "airpodspro")
                    .font(.system(size: deviceTextSize))
                Text("AirPods • Lossless")
                    .font(.system(size: deviceTextSize))
            }
            .foregroundStyle(.green)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 28)
            .padding(.top, 20)
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Reproduzindo em AirPods com qualidade Lossless")

            Spacer()
        }
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.55, green: 0.15, blue: 0.12),
                    Color(red: 0.20, green: 0.08, blue: 0.07),
                    Color(red: 0.08, green: 0.04, blue: 0.04)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }

    // MARK: - iPad Portrait

    // Conteúdo scrollável acima + barra Now Playing compacta + tab bar embaixo.
    @ViewBuilder
    private func iPadPortraitContent(geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {

                    backButton
                        .padding(.top, 8)

                    Image("album_cover")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 360, maxHeight: 360)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: .black.opacity(0.4), radius: 16, x: 0, y: 8)
                        .accessibilityLabel("Capa do álbum 1 Remastered dos Beatles")
                        .padding(.bottom, 8)

                    albumInfo
                    songList
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 28)
                .padding(.bottom, 40)
            }

            nowPlayingBar
            TabBarView()
        }
    }

    // MARK: - Now Playing Bar (Portrait)

    // Barra compacta horizontal: capa pequena + título + progresso + controles.
    private var nowPlayingBar: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.white.opacity(0.1))
                .frame(height: 0.5)

            HStack(spacing: 14) {

                Image("album_cover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 52, height: 52)
                    .clipShape(RoundedRectangle(cornerRadius: 6))

                VStack(alignment: .leading, spacing: 2) {
                    Text("From Me to You - Mono / Remastered")
                        .font(.system(size: barTitleSize, weight: .semibold))
                        .foregroundStyle(.white)
                        .lineLimit(1)

                    Text("The Beatles")
                        .font(.system(size: barArtistSize))
                        .foregroundStyle(Color(white: 0.5))
                        .lineLimit(1)
                }

                Spacer()

                ProgressView(value: 0.55)
                    .progressViewStyle(.linear)
                    .tint(.white)
                    .frame(width: 120)

                // Controles (fixos em LTR)
                HStack(spacing: 20) {
                    Image(systemName: "backward.end.fill")
                        .font(.system(size: barControlSize))
                        .foregroundStyle(.white)
                        .accessibilityLabel("Música anterior")

                    Button {
                        print("Play/Pause")
                    } label: {
                        Image(systemName: "pause.fill")
                            .font(.system(size: barPauseSize))
                            .foregroundStyle(.white)
                    }
                    .accessibilityLabel("Pausar")
                    .accessibilityHint("Toque duas vezes para pausar a reprodução")

                    Image(systemName: "forward.end.fill")
                        .font(.system(size: barControlSize))
                        .foregroundStyle(.white)
                        .accessibilityLabel("Próxima música")
                }

                Image(systemName: "airpodspro")
                    .font(.system(size: barDeviceSize))
                    .foregroundStyle(.green)
                    .accessibilityLabel("Reproduzindo em AirPods")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color(white: 0.08))
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Tocando agora: From Me to You dos Beatles, 55 por cento concluído")
    }

    // MARK: - Shared Components

    // Botão de voltar reutilizado nos layouts iPad (landscape e portrait).
    // chevron.backward espelha automaticamente em RTL.
    private var backButton: some View {
        HStack {
            Button {
                print("Back tapped")
            } label: {
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
    }

    // MARK: - Background

    private var backgroundGradient: some View {
        LinearGradient(
            colors: [
                Color(red: 0.68, green: 0.19, blue: 0.15),
                Color(red: 0.16, green: 0.07, blue: 0.06),
                Color.black
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }

    // MARK: - Album Info

    // Título do álbum, artista, tipo/ano e botões de ação (curtir, baixar, opções, play).
    private var albumInfo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("1(Remastered)")
                .font(.system(size: albumTitleSize, weight: .bold))
                .foregroundStyle(.white)
                .lineLimit(2)
                .minimumScaleFactor(0.8)

            HStack(spacing: 8) {
                Image("artist")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: adaptiveAvatarSize,
                        height: adaptiveAvatarSize
                    )
                    .clipShape(Circle())
                    .accessibilityHidden(true)

                Text("The Beatles")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .bold()
            }

            Text("Album • 2000")
                .font(.body)
                .foregroundStyle(.gray)

            HStack(spacing: 28) {
                Image(systemName: "heart")
                    .accessibilityLabel("Curtir álbum")
                Image(systemName: "arrow.down.circle.fill")
                    .foregroundStyle(.green)
                    .accessibilityLabel("Baixar álbum")
                Image(systemName: "ellipsis")
                    .accessibilityLabel("Mais opções do álbum")
                Spacer()

                Button {
                    print("Play tapped")
                } label: {
                    Image(systemName: "pause.fill")
                        .font(.system(size: playButtonIconSize, weight: .bold))
                        .foregroundStyle(.black)
                        .frame(width: 54, height: 54)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                .accessibilityLabel("Pausar álbum")
                .accessibilityHint("Toque duas vezes para pausar a reprodução")
            }
            .font(.title2)
            .foregroundStyle(.gray)
        }
    }

    // MARK: - Song List

    private var songList: some View {
        VStack(spacing: 18) {
            ForEach(songs) { song in
                SongRowView(song: song)
            }
        }
    }

    // MARK: - Helpers

    // Avatar maior no iPad e menor no iPhone.
    private var adaptiveAvatarSize: CGFloat {
        horizontalSizeClass == .regular ? 56 : 48
    }
}
