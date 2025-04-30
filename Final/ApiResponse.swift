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

    struct Weather: Codable {
        let description: String
        let icon: String
    }

    struct Main: Codable {
        let temp: Double
        let humidity: Int
        let temp_max: Double
        let temp_min: Double
    }
}
