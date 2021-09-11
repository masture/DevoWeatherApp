//
//  ContentView.swift
//  WeatherApp-Trial-One
//
//  Created by Pankaj Kulkarni on 10/09/21.
//

import SwiftUI

struct ContentView: View {
//    @State var cities: [String] = []
    @ObservedObject var cityStore = WeatherModel()
    @State var newCity: String = ""
    
    var body: some View {
        return NavigationView {
            VStack {
                HStack {
                    TextField("Enter city name", text: $newCity)
                    Button("Add City") {
                        cityStore.addCity(name: newCity)
                        newCity = ""
                    }
                }
                .padding()
                List {
                    ForEach(cityStore.cities) { city in
                        NavigationLink(destination: DetailedWeatherView(city: city)) {
                            CityRowView(city: city)
                                .frame(height: 56)
                        }
                    }
                }
                .listStyle(InsetListStyle())
            }
            .navigationTitle("Devo Weather")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
    }
}
