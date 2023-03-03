//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Jamie Carruthers on 03/03/2023.
//

import Foundation

struct ArtistResponse: Codable {
    var resultCount: Int
    var results: [Artist]
}
