//
//  WeatherManager.swift
//  WeatherAppAdv
//
//  Created by Mahmoud on 7/31/22.
//

import Foundation
//MARK:- Protocol
protocol WeatherManagerPr {
    func dataDidLoad(data: TodayWeatherModel)
    func dataFaildData(error: String)
}

//MARK:- Weather Manager
class WeatherManager  {
    //MARK:- Properties
    var delegate: WeatherManagerPr?
    
    //MARK:- Methods
    func getWeatherData(longi: Int, Latit: Int) {
        // Code goes here
        let userId = "248c051620380d107a0dd53c88a86cd7"
        let url   = "https://api.openweathermap.org/data/2.5/weather?lat=\(Latit)&lon=\(longi)&appid=\(userId)&units=metric"
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            do{
                guard let data = data else {return}
                let jsonDecoder = try JSONDecoder().decode(TodayWeatherModel.self, from: data)
                self.delegate?.dataDidLoad(data: jsonDecoder)
            }catch{
                self.delegate?.dataFaildData(error: error.localizedDescription)
                print("Error \(error.localizedDescription)")
            }
        }
        task.resume()
    }


}
