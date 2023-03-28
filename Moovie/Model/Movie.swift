//
//  Movie.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 28/03/23.
//

import Foundation

struct MovieData: Codable {
    struct Movie: Codable, Identifiable {
        let id: Int
        let title: String
        let overview: String
        let release_date: String
        let popularity: Double
        let poster_path: String
        let vote_average: Double
        let vote_count: Int
    }
    
    let results: [Movie]
}
