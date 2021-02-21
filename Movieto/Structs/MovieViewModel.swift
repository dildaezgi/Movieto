//
//  MovieViewModel.swift
//  Movieto
//
//  Created by Dilda Ezgi Metincan on 21.02.2021.
//

import Foundation

class MovieViewModel {
    
    private var apiService = ApiService()
    private var popularMovies = [MovieResult]()
    
    func fetchPopularMoviesData(completion: @escaping () -> ()) {
        apiService.getPopularMoviesData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.popularMovies = listOf.results
                completion()
            case .failure(let error):
                print("Error processin json data: \(error)")
            
           
            }
        }
    }
    
    func numverOfRowsInSection(section: Int) -> Int {
        if popularMovies.count != 0 {
            return popularMovies.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> MovieResult {
        return popularMovies[indexPath.row]
    }
}
