//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Pankaj Kulkarni on 21/08/21.
//

import Foundation
import Combine


/// Fetch  weather from: http://api.openweathermap.org
class WeatherService {
    
    #warning("TODO: Please replace this API key with your own API key")
    let APKKey = "fa1e5a475001e8240c5ba2fb52496758"
    
    func fetchWeatherPublisher(city: String) -> AnyPublisher<WeatherResponse, Error> {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(APKKey)") else {
            fatalError()
        }
        print("URL: \(url.absoluteString)")
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}


