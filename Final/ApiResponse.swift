//
//  ApiResponse.swift
//  Final
//
//  Created by WADE, RYLAN on 4/28/25.
//

struct ApiResponse :Codable {
    let weather: WeatherMain
}

struct WeatherMain :Codable {
    let temp: String
    let feels_like: String
    let temp_min: String
    let temp_max: String
    let humidity: String
}

