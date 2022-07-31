//
//  FetchWeatherClass.swift
//  WeatherAppAdv
//
//  Created by Mahmoud on 7/31/22.
//

import Foundation

class FetchWeatherClass: FetchWeatherPr {

    

    //MARK:- Properties
    var weatherManager = WeatherManager()
    
    //MARK:- Methods

    func getWeatherData(longi: Int, Latit: Int) {
        weatherManager.getWeatherData(longi: longi, Latit: Latit)
    }
    
    func getDailyData(longi: Int, Latit: Int) {
        weatherManager.getDailyData(longi: longi, Latit: Latit)
    }
}
