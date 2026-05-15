//  TabBarView.swift
//  Challenge14
//  Created by Júlia Clovandi Vasconcelos  on 14/05/26.

// Tab bar customizada com 3 itens (Home, Search, Library).
// Cada item ocupa 1/3 da largura com maxWidth: .infinity.
// Títulos usam LocalizedStringKey pra tradução automática.

import SwiftUI

struct TabBarView: View {

    var body: some View {
        VStack(spacing: 0) {

            // Linha separadora fina no topo
            Rectangle()
                .fill(Color.white.opacity(0.15))
                .frame(height: 0.5)

            HStack(spacing: 0) {

                tabItem(
                    icon: "house.fill",
                    title: "Home",
                    selected: true
                )

                tabItem(
                    icon: "magnifyingglass",
                    title: "Search",
                    selected: false
                )

                tabItem(
                    icon: "books.vertical.fill",
                    title: "Your Library",
                    selected: false
                )
            }
            .padding(.top, 12)
            .padding(.bottom, 28)
        }
        .background(Color.black)
    }

    // MARK: - Tab Item

    // Cria um tab com ícone + label. Branco se selecionado, cinza se não.
    private func tabItem(
        icon: String,
        title: LocalizedStringKey,
        selected: Bool
    ) -> some View {
        VStack(spacing: 4) {

            Image(systemName: icon)
                .font(.title2)

            Text(title)
                .font(.caption)
        }
        .foregroundStyle(selected ? .white : .gray)
        .frame(maxWidth: .infinity)
        .accessibilityAddTraits(selected ? .isSelected : [])
        .accessibilityHint("Toque duas vezes para navegar até \(icon == "house.fill" ? "Início" : icon == "magnifyingglass" ? "Buscar" : "Sua Biblioteca")")
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        VStack {
            Spacer()
            TabBarView()
        }
    }
}
