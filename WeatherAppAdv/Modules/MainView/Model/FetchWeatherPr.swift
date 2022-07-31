//
//  FetchWeatherPr.swift
//  WeatherAppAdv
//
//  Created by Mahmoud on 7/31/22.
//

import Foundation
protocol FetchWeatherPr {
    func getWeatherData(longi: Int, Latit: Int)
    func getDailyData(longi: Int, Latit: Int)
}
