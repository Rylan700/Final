//
//  ApiResponse.swift
//  Final
//
//  Created by WADE, RYLAN on 4/28/25.
//

struct WeatherResponse: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Codable {
    let description: String
}
