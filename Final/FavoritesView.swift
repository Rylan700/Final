//
//  FavoritesView.swift
//  Final
//
//  Created by PETERS, SEAN on 4/29/25.
//

import SwiftUI

struct FavoritesView: View {
    @AppStorage("favorites") var favoritesData: Data = Data()
    @State private var favorites: [WeatherResponse] = []

    var body: some View {
        ZStack{
            Image("skybackground")
                .resizable()
                .ignoresSafeArea(.all)
                .background(Color.black)
            NavigationView {
                List(favorites, id: \.name) { weather in
                    NavigationLink(destination: FavoritesData(weather: weather)) {
                        VStack(alignment: .leading) {
                            Text(weather.name)
                                .font(.headline)
                            Text("\(weather.main.temp, specifier: "%.1f")°F")
                        }
                    }
                }
                .navigationTitle("Favorites")
            }
            .onAppear(perform: loadFavorites)
        }
    }

    private func loadFavorites() {
        if let decoded = try? JSONDecoder().decode([WeatherResponse].self, from: favoritesData) {
            favorites = decoded
        }
    }
}
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
