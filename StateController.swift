//
//  StateController.swift
//  MusicByLocation
//
//  Created by Jamie Carruthers on 03/03/2023.
//

import Foundation

class StateController: ObservableObject {
    @Published var lastKnownLocation : String = ""
    let locationHandler = LocationHandler()
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
}
