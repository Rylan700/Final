//
//  DashboardView.swift
//  Final
//
//  Created by WADE, RYLAN on 4/28/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = APICall()
    @State private var cityName: String = ""
    @State private var favorites: [WeatherResponse] = []
    @State private var weatherResults: [WeatherResponse] = []
    @State private var showWeather = false

    var body: some View {
        ZStack {
            Image("skybackground")
                .resizable()
                .ignoresSafeArea(.all)
                .background(Color.black)
            
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color(red: 132 / 255, green: 222 / 255, blue: 120 / 255))
                    .frame(width: 450, height: 100)
            }
            .ignoresSafeArea()
            
            VStack {
                Text("Todays Weather")
                    .font(.largeTitle).bold()
                    .foregroundColor(.black)
                
                TextField(
                    "Enter City Name",
                    text: $cityName
                )
                .frame(width: 300, height: 50)
                .background(Color(red: 132 / 255, green: 172 / 255, blue: 220 / 255))
                .cornerRadius(15)
                
                if showWeather {
                    VStack{
                        Text(viewModel.cityName).font(.title2).bold()
                        Text("Temperature: \(viewModel.citytemp)°F")
                        Text("Condition: \(viewModel.cityweather)")
                        Text("Feels Like: \(viewModel.feelsLike)°F")
                    }
                }
                HStack{
                    Button("Get Weather"){
                        viewModel.getWeather(selectedCity: cityName)
                        showWeather = true
                    }
                    .frame(width: 120, height: 30)
                    .background(.green)
                    .cornerRadius(15)
                    
                    Button("Add to Favorites") {
                        let weather = WeatherResponse(
                            name: viewModel.cityName,
                            weather: [WeatherResponse.Weather(description: viewModel.cityweather, icon: "")],
                            main: WeatherResponse.Main(
                                temp: Double(viewModel.citytemp) ?? 0.0,
                                humidity: 0,
                                temp_max: Double(viewModel.maxTemp) ?? 0.0,
                                temp_min: Double(viewModel.minTemp) ?? 0.0,
                                feels_like: Double(viewModel.feelsLike) ?? 0.0
                            ), wind: WeatherResponse.Wind(
                                speed: Double(viewModel.speed) ?? 0.0
                            )
                        )

                        favorites.append(weather)

                        if let encoded = try? JSONEncoder().encode(favorites) {
                            UserDefaults.standard.set(encoded, forKey: "favorites")
                        }
                    }
                    .frame(width: 150, height: 30)
                    .background(.green)
                    .cornerRadius(15)
                }.padding(.top, 20)
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
