//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Jamie Carruthers on 02/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    
    var body: some View {
        let list = state.artistsByLocation.split(separator: ", ")
        VStack(alignment: .center) {
            List(Array(list), id: \.self) { artist in
                Text("\(String(artist))")
            }
                .padding()
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
