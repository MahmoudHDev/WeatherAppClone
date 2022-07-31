//
//  Main+LocationManager.swift
//  WeatherAppAdv
//
//  Created by Mahmoud on 7/31/22.
//

import UIKit
import CoreLocation

//MARK:- Core Location
extension MainViewController: CLLocationManagerDelegate {
    
    func locationManagerConfig() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()

        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        
        guard let coordinates = locations.last?.coordinate else {return}
        let longi = Int(coordinates.longitude)
        let latit = Int(coordinates.latitude)
        presenter?.fetchData(longi: longi, latit: latit)
        
    }
}
