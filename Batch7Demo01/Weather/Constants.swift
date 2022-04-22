//
//  Constants.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 8/17/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct Constants {
    struct URLs {
        static func weather(city: String) -> String {
            return "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=31e362373da360bb7aa3a1e9ef6f87e0&units=imperial"
        }
    }    
}
