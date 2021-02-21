//
//  MovieCollectionViewCell.swift
//  Movieto
//
//  Created by Dilda Ezgi Metincan on 21.02.2021.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    private var urlString: String = ""
    
    func setCellWithValuesOf(_ movie: MovieResult) {
        updateUI(title: movie.title , poster: movie.posterPath )
    }
    
    private func updateUI(title: String?, poster: String?) {
        
        self.movieTitle.text = title
        
        guard let posterString = poster else {return}
        urlString = "https://image.tmdb.org/t/p/w500" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.movieImage.image = UIImage(named: "noImageAvailable")
            return
        }
        
        //clear the old one
        self.movieImage.image = nil
        
        getImageDataFrom(url: posterImageURL)
       
    }
    
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error ) in
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Empty data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.movieImage.image = image
                }
            }
        }.resume()
    }
    
}
