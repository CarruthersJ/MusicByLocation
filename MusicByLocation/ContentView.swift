//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Jamie Carruthers on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    var listOfArtists: [String] = []
    
    var body: some View {
        let list = state.artistsByLocation.split(separator: ", ")
        listOfArtists.addStringsFromArrayOfSubstrings(substringArray: list)
        
        VStack(alignment: .center) {
            List(listOfArtists, id: \.self) { artist in
                Text("\(String(artist))")
            }
            Spacer()
            Button("Find Music", action: {
                state.findMusic()
            })
        }.onAppear() {
            state.requestAccessToLocationData()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
