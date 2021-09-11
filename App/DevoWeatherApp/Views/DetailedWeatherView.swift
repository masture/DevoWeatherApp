//
//  DetailedWeatherView.swift
//  WeatherApp-Trial-One
//
//  Created by Pankaj Kulkarni on 10/09/21.
//

import SwiftUI

struct DetailedWeatherView: View {
    let city: City
    var body: some View {
        VStack {
            VStack {
                HStack (alignment: .top) {
                    Text(String(format: "%0.0f", city.weatherResponse?.main.temperature ?? 0.0) )
                        .font(.system(size: 100, weight: .ultraLight, design: .rounded))
                    Text("℃")
                        .font(.title)
                        .padding(.top)
                }
                
                HStack {
                    Text(String(format: "H: %0.0f°", city.weatherResponse?.main.high ?? 0.0) )
                    Text(String(format: "L: %0.0f°", city.weatherResponse?.main.low ?? 0.0) )
                }
            }
            Text(city.weatherResponse?.weather.first?.main ?? "")
                .font(.title)
                .padding(.top)
            Text(city.weatherResponse?.weather.first?.description ?? "")
                .font(.title3)
            Spacer()
            HStack {
                VStack {
                    Text("45%")
                    Text("Humidity")
                }
                Spacer()
                VStack {
                    Text("1000 hPa")
                    Text("Pressure")
                }
            }
            .padding()
            Spacer()
        }
        .foregroundColor(.white)
        .navigationTitle(city.name)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
//            LinearGradient(gradient: city.gradient, startPoint: .top, endPoint: .bottom)
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct DetailedWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedWeatherView(city: City(name: "Paris", weatherResponse: nil))
    }
}
