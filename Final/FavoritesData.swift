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
        ZStack {
            Image("skybackground")
                .resizable()
                .ignoresSafeArea(.all)
                .background(Color.black)
        VStack(spacing: 20) {
            Text(weather.name)
                .font(.largeTitle)
                .bold()
            
            Text("Temperature: \(weather.main.temp, specifier: "%.1f")°F")
            Text("Feels Like: \(weather.main.feels_like, specifier: "%.1f")°F")
            Text("Low: \(weather.main.temp_min, specifier: "%.1f")°F")
            Text("High: \(weather.main.temp_max, specifier: "%.1f")°F")
            Text("Condition: \(weather.weather.first?.description.capitalized ?? "N/A")")
            Text("Wind Speed: \(weather.wind.speed, specifier: "%.1f")°F")
        }
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
