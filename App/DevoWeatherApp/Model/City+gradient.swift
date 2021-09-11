//
//  City+gradient.swift
//  WeatherApp-Trial-One
//
//  Created by Pankaj Kulkarni on 11/09/21.
//

import Foundation
import SwiftUI

extension City {
    var gradient: Gradient {
        var gradient: Gradient
        if let main = weatherResponse?.main {
            if main.temperature < 10 {
                gradient = Gradient(colors: [Color.blue, .purple])
            } else if main.temperature < 24 {
                gradient = Gradient(colors: [Color.purple, .orange])
            } else {
                gradient = Gradient(colors: [.orange, .red])
            }
        } else {
            gradient = Gradient(colors: [Color.blue, Color.white])
        }
        return gradient
    }
}
