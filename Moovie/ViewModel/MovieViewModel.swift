//
//  MovieViewModel.swift
//  Moovie
//
//  Created by Putut Yusri Bahtiar on 28/03/23.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var results: [MovieData.Movie] = []
    
    init() {
        fetchMovies()
    }
    
    func fetchMovies() {
        let apikey = "2aa5c9d99510889a465d1bb517005821"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apikey)&language=en-US&page=1&region=id")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("error fetching data \(error?.localizedDescription ?? "Unkown Error")")
                return
            }
            do {
                let result = try JSONDecoder().decode(MovieData.self, from: data)
                DispatchQueue.main.async {
                    self.results = result.results
                }
            } catch {
                print("error decoding movies \(error)")
            }
        }
        task.resume()
    }
}
