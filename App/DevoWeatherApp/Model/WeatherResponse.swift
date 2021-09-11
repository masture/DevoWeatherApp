//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Pankaj Kulkarni on 21/08/21.
//

import Foundation
 

// Refer https://openweathermap.org/current#name

struct WeatherResponse: Decodable {
    let main: Weather
    let weather: [WeatherDescription]
}


struct Weather: Decodable {
    let temperature: Double
    let pressure: Double
    let humidity: Double
    let high: Double
    let low: Double

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
        case high = "temp_max"
        case low = "temp_min"
    }
    
}

struct WeatherDescription: Decodable {
    let main: String
    let description: String
}












extension WeatherResponse {
    
    static var coldWeather: WeatherResponse {
        let main = Weather(temperature: 9, pressure: 1016, humidity: 77, high: 24, low: 17)
        let weather = WeatherDescription(main: "Sunny", description: "Light Clouds")
        let weatherResponse = WeatherResponse(main: main, weather: [weather])
        return weatherResponse
    }
    
    static var goodWeather: WeatherResponse {
        let main = Weather(temperature: 21, pressure: 1013, humidity: 87, high: 28, low: 19)
        let weather = WeatherDescription(main: "Cloudy", description: "Broken Clouds")
        let weatherResponse = WeatherResponse(main: main, weather: [weather])
        return weatherResponse
    }
    
    static var hotWeather: WeatherResponse {
        let main = Weather(temperature: 31, pressure: 1010, humidity: 38, high: 35, low: 26)
        let weather = WeatherDescription(main: "Sunny", description: "Clear Sky")
        let weatherResponse = WeatherResponse(main: main, weather: [weather])
        return weatherResponse
    }
}
