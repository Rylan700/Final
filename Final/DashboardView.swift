//
//  DashboardView.swift
//  Final
//
//  Created by WADE, RYLAN on 4/28/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var cityName: String = "Springfield"
    @State private var weatherResults: [WeatherResponse] = []
    @State private var selectedWeather: WeatherResponse?
    @State private var favorites: [WeatherResponse] = []

    var body: some View {
        ZStack {
            Image("skybackground")
                .resizable()
                .ignoresSafeArea(.all)
                .background(Color.black)
            VStack {
                Text("Todays Weather")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                TextField(
                    "Enter City Name",
                    text: $cityName
                )
                .frame(width: 300, height: 50)
                .background(Color(red: 32 / 255, green: 142 / 255, blue: 220 / 255))
                .cornerRadius(15)
                
                Text(cityName)
                Text(temperature)
                HStack{
                    Text(weather)
                    Image(systemName: icon)
                }
                
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
