//
//  LocationHandling.swift
//  MusicByLocation
//
//  Created by Jamie Carruthers on 02/03/2023.
//

import Foundation
import CoreLocation

class LocationHandler : NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    @Published var city: String = ""
    @Published var country: String = ""
    @Published var latitudeCoordinates: String = ""
    @Published var longtitudeCoordinates : String = ""
     
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error ) in
                if error != nil {
                    self.city = "Could not perform look up of location from coordinate information"
                } else  {
                    if let firstPlacemark = placemarks?[0] {
                        self.city = firstPlacemark.locality ?? "Couldn't find locality"
                        self.country = firstPlacemark.country ?? "Could not find country"
                        self.latitudeCoordinates = "\(firstLocation.coordinate.latitude)" 
                        self.longtitudeCoordinates = "\(firstLocation.coordinate.longitude)" ?? "Unable to find longtitude coordinates"
                        
                    }
                }
            })
        }
            
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        city = "Error finding location"
    }
}
