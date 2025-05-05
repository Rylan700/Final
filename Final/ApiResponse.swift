//
//  ApiResponse.swift
//  Final
//
//  Created by WADE, RYLAN on 4/28/25.
//
import Foundation

struct WeatherResponse: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
    let wind: Wind

    struct Weather: Codable {
        let description: String
        let icon: String
    }

    struct Main: Codable {
        let temp: Double
        let humidity: Int
        let temp_max: Double
        let temp_min: Double
        let feels_like: Double
    }
    struct Wind: Codable {
        let speed: Double
    }
}

