//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Jamie Carruthers on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationHandler = LocationHandler()
    var body: some View {
        VStack(alignment: .center) {
            Form {
                Text(locationHandler.lastKnownLocation)
            }
            
            Spacer()
            Button("Find Music", action: {
                locationHandler.requestLocation()
            })
        }
        .onAppear() {
            locationHandler.requestAuthorisation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
