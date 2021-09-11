//
//  WeatherModel.swift
//  WeatherApp-Trial-One
//
//  Created by Pankaj Kulkarni on 11/09/21.
//

import Foundation
import Combine

class WeatherModel: ObservableObject {
    @Published var cities = [City]()
    
    public func addCity(name: String) {
        let city = City(name: name)
        cities.append(city)
//        fetchWeather(city: name)
        mockFetchWeather(city: name)
    }
    
    private var cancellables: [AnyCancellable] = []
    
    func mockFetchWeather(city: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let weatherResponse = WeatherResponse.goodWeather
            if let index = self.cities.firstIndex(where: { $0.name == city}) {
                self.cities[index].weatherResponse = weatherResponse
            }
        }
    }
    
    func fetchWeather(city: String) {
        let cancellable = WeatherService().fetchWeatherPublisher(city: city)
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { weatherResponse in
                if let index = self.cities.firstIndex(where: { $0.name == city}) {
                    self.cities[index].weatherResponse = weatherResponse
                }
            })
        cancellables.append(cancellable)
    }
}
