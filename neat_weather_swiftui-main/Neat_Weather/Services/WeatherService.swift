//
//  WeatherService.swift
//  Neat_Weather
//
//  Created by David Koenig on 26.01.20.
//  Copyright © 2020 David Koenig. All rights reserved.
//

import Foundation

class WeatherService {
    
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=YOURAPIKEY&units=metric") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
}
