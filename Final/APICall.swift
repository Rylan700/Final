//
//  APICall.swift
//  Final
//
//  Created by WADE, RYLAN on 4/28/25.
//

import Foundation

class APICall : ObservableObject{
    @Published var cityName: String = ""
    @Published var citytemp: String = ""
    @Published var cityweather: String = ""
    @Published var maxTemp: String = ""
    @Published var minTemp: String = ""

    func getWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Springfield&units=imperial&appid=745e5645454545454545454545454545") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.cityName = decodedResponse.name
                        self.citytemp = String(format: "%.1f", decodedResponse.main.temp)
                        self.cityweather = decodedResponse.weather.first?.description.capitalized ?? "N/A"
                        self.maxTemp = String(format: "%.1f", decodedResponse.main.temp_max)
                        self.minTemp = String(format: "%.1f", decodedResponse.main.temp_min)
                    }
                } catch {
                    print("Decoding Error: \(error)")
                }
            } else if let error = error {
                print("HTTP Request Failed: \(error)")
            }
        }.resume()
    }
}
