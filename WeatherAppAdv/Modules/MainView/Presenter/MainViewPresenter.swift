//
//  MainViewPresenter.swift
//  WeatherAppAdv
//
//  Created by Mahmoud on 7/31/22.
//

import Foundation

//MARK:- Protocol
protocol MainViewPr {
    func dataDidLoad(data: TodayWeatherModel)
    func dailyDataLoaded(data: TodayWeatherModel)
    func dataFaildLoad(error: String)
}

//MARK:- Presenter
class MainViewPresenter {
    //MARK:- Properties
    var view: MainViewPr?
    var fetchWeather = FetchWeatherClass()
    
    //MARK:- Init
    init(view: MainViewPr) {
        self.view = view
        fetchWeather.weatherManager.delegate = self
    }
    
    
    //MARK:- Methods
    // Load Weather Data
    func fetchData(longi: Int, latit: Int)  {
        fetchWeather.getWeatherData(longi: longi, Latit: latit)
    }
    
    func fetchDaysData(longi: Int, latit: Int){
        fetchWeather.getDailyData(longi: longi, Latit: latit)
    }
    
}

//MARK:- Protocol

extension MainViewPresenter: WeatherManagerPr {
    
    func dataDidLoad(data: TodayWeatherModel) {
        self.view?.dataDidLoad(data: data)
    }
    
    func dataFaildData(error: String) {
        self.view?.dataFaildLoad(error: error)
    }
    func dailyDataDidLoad(data: TodayWeatherModel) {
        self.view?.dailyDataLoaded(data: data)
    }
    
}
