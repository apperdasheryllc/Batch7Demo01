//
//  LocationManager.swift
//  Batch7Demo01
//
//  Created by Suneeth on 4/21/22.
//

import Foundation
import CoreLocation

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
            CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
class LocationManager: NSObject, CLLocationManagerDelegate {
        static let shared = LocationManager()
        let manager = CLLocationManager()
        var completion: ((String) -> Void)?
        public func getUserLocation(completion: @escaping((String) -> Void)) {
            self.completion = completion
            manager.requestWhenInUseAuthorization()
            manager.delegate = self
            manager.startUpdatingLocation()
        }
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else {
                return
            }
            location.fetchCityAndCountry { [weak self ] (city, country, error) in
                if let city = city {
                    self?.completion?(city)
                }
                manager.stopUpdatingLocation()
            }
        }
}
