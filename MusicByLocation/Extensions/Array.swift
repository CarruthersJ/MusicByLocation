//
//  Array.swift
//  MusicByLocation
//
//  Created by Jamie Carruthers on 15/03/2023.
//

import Foundation

extension [String] {
    mutating func addStringsFromArrayOfSubstrings(substringArray: [Substring]) {
        for substring in substringArray {
            self.append(String(substring))
        }
    }
}
