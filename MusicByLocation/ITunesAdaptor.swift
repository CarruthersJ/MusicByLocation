//
//  ITunesAdaptor.swift
//  MusicByLocation
//
//  Created by Jamie Carruthers on 06/03/2023.
//

import Foundation

class ITunesAdaptor {
    let startOfUrl = "https://itunes.apple.com"
    
    func getArtists(search: String, completion: @escaping ([Artist]?) -> Void ) {
        
        let endOfUrl = "/search?term=\(search)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: startOfUrl + endOfUrl)
        else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    completion(response.results)
                } else {
                    completion(nil)
                }
            }
        }.resume()
            
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Error decoding JSON")
            return nil
        }
    }

}
