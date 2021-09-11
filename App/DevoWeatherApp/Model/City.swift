//
//  City.swift
//  WeatherApp-Trial-One
//
//  Created by Pankaj Kulkarni on 10/09/21.
//

import Foundation

struct City: Identifiable {
    let id = UUID()
    let name: String
    var weatherResponse: WeatherResponse? = nil
    
}

extension City {
    
    var isWeatherAvailable: Bool {
        weatherResponse != nil
    }
    
    
    var temperature: Double {
        weatherResponse?.main.temperature ?? 0.0
    }
    
    var pressure: Double {
        weatherResponse?.main.pressure ?? 0.0
    }
}

