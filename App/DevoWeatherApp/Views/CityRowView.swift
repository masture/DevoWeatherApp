//
//  CityRowView.swift
//  DevoWeatherApp
//
//  Created by Pankaj Kulkarni on 10/09/21.
//

import SwiftUI

struct CityRowView: View {
    let city: City
    var body: some View {
        HStack {
            Text(city.name)
                .font(.title)
            Spacer()
            if let weather = city.weatherResponse  {
                Text(String(format: "%.2f", weather.main.temperature))
                .font(.title2)
            } else {
                ProgressView()
            }
        }
//        .background(LinearGradient(gradient: city.gradient, startPoint: .trailing, endPoint: .leading))
    }
}

struct CityCardView_Previews: PreviewProvider {
    static var previews: some View {
        CityRowView(city: City(name: "Bengalore"))
            .previewLayout(.sizeThatFits)
    }
}
