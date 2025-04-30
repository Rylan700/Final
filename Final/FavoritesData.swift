//
//  FavoritesData.swift
//  Final
//
//  Created by PETERS, SEAN on 4/29/25.
//

import SwiftUI

struct FavoritesData: View {
    let weather: WeatherResponse
    @AppStorage("favorites") var favoritesData: Data = Data()
    @State private var favorites: [WeatherResponse] = []

    var body: some View {
        VStack(spacing: 20) {
            Text(weather.name)
                .font(.largeTitle)
                .bold()

            Text("Temperature: \(weather.main.temp, specifier: "%.1f")°F")
            Text("Humidity: \(weather.main.humidity)%")
            Text("Condition: \(weather.weather.first?.description.capitalized ?? "N/A")")

            Button(action: addToFavorites) {
                Label("Add to Favorites", systemImage: "star")
            }
            .padding()
            .background(Color.yellow.opacity(0.3))
            .cornerRadius(10)
        }
        .onAppear {
            loadFavorites()
        }
    }

    func addToFavorites() {
        favorites.append(weather)
        if let encoded = try? JSONEncoder().encode(favorites) {
            favoritesData = encoded
        }
    }

    func loadFavorites() {
        if let decoded = try? JSONDecoder().decode([WeatherResponse].self, from: favoritesData) {
            favorites = decoded
        }
    }
}
