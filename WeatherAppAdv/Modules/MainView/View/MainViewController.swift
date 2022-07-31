//
//  ViewController.swift
//  WeatherAppAdv
//
//  Created by Mahmoud on 7/31/22.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var cityNameLbl      : UILabel!
    @IBOutlet weak var weatherDisc      : UILabel!
    @IBOutlet weak var weatherTemp      : UILabel!
    @IBOutlet weak var weatherImg       : UIImageView!
    @IBOutlet weak var collectionView   : UICollectionView!
    
    //MARK:- Properties
    var presenter       : MainViewPresenter?
    var locationManager = CLLocationManager()
    var weatherModel    = [TodayWeatherModel]()
    
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainViewPresenter(view: self)
        locationManagerConfig()
    }

    //MARK:- Actions


}

//MARK:- Presenter
extension MainViewController: MainViewPr {

    func dataDidLoad(data: TodayWeatherModel) {
        DispatchQueue.main.async{
            self.cityNameLbl.text = "\(data.name), \(data.sys.country)"
            self.weatherDisc.text = data.weather[0].weatherDescription
            self.weatherTemp.text = "\(data.main.temp)°"
        }
    }
    
    func dataFaildLoad(error: String) {
        DispatchQueue.main.async {
            print("Error")
        }
    }
    
    func dailyDataLoaded(data: TodayWeatherModel) {
        print("Add to array \(weatherModel.count)")
        weatherModel.append(data)
    }
    
}
