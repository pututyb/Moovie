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
        let genre_ids: [Int]
        let overview: String
        let release_date: String
        let popularity: Double
        let poster_path: String?
        let backdrop_path: String?
        let vote_average: Double
        let vote_count: Int
        
        var posterURL: URL? {
            guard let posterPath = poster_path else {
                return nil
            }
            return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
        }
        
        var backdropPath: URL? {
            guard let backdropPath = backdrop_path else {
                return nil
            }
            return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath)")
        }
    }
    
    let results: [Movie]
}
