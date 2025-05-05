//
//  ContentView.swift
//  Final
//
//  Created by PETERS, SEAN on 4/28/25.
//
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Weather", systemImage: "cloud.circle.fill")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .symbolRenderingMode(.palette)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
