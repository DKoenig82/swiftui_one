//
//  Weather.swift
//  Neat_Weather
//
//  Created by David Koenig on 26.01.20.
//  Copyright © 2020 David Koenig. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
