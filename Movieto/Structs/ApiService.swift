//
//  ApiService.swift
//  Movieto
//
//  Created by Dilda Ezgi Metincan on 21.02.2021.
//

import Foundation

class ApiService {
    private var dataTask: URLSessionDataTask?
    
    func getPopularMoviesData(completion: @escaping (Result<Movie, Error>) -> Void) {
        
        let popularMoviesURL = "https://api.themoviedb.org/3/discover/movie?api_key=cb90d18725737fe5f0c0e8ed18ab7a81&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
        
        guard let url = URL(string: popularMoviesURL) else {
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data , response, error) in
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("Empty data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Movie.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            }catch let error {
                completion(.failure(error))
            }
           
        }
        dataTask?.resume()
    }
    
}
