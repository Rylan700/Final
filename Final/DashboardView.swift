//
//  DashboardView.swift
//  Final
//
//  Created by WADE, RYLAN on 4/28/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = APICall()
    @State private var cityName: String = "Springfield"
    @State private var favorites: [WeatherResponse] = []
    @State private var weatherResults: [WeatherResponse] = []

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
                
                VStack {
                    Text(viewModel.cityName).font(.title2).bold()
                    Text("Temp: \(viewModel.citytemp)°F")
                    Text("Condition: \(viewModel.cityweather)")
                    Text("Max: \(viewModel.maxTemp)°F")
                    Text("Min: \(viewModel.minTemp)°F")
                }
                
                HStack{
                    Button("Get Weather"){
                        viewModel.getWeather(selectedCity: cityName)
                    }
                    .frame(width: 100)
                    .background(.red)
                    
                    Button("Add to Favorites") {
                        let weather = WeatherResponse(
                            name: viewModel.cityName,
                            weather: [WeatherResponse.Weather(description: viewModel.cityweather, icon: "")],
                            main: WeatherResponse.Main(
                                temp: Double(viewModel.citytemp) ?? 0.0,
                                humidity: 0,
                                temp_max: Double(viewModel.maxTemp) ?? 0.0,
                                temp_min: Double(viewModel.minTemp) ?? 0.0
                            )
                        )

                        favorites.append(weather)

                        if let encoded = try? JSONEncoder().encode(favorites) {
                            UserDefaults.standard.set(encoded, forKey: "favorites")
                        }
                    }
                }
            }
            .onAppear {
                viewModel.getWeather(selectedCity: cityName)
                if let data = UserDefaults.standard.data(forKey: "favorites"),
                   let decoded = try? JSONDecoder().decode([WeatherResponse].self, from: data) {
                    favorites = decoded
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
