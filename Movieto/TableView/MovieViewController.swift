//
//  MovieViewController.swift
//  Movieto
//
//  Created by Dilda Ezgi Metincan on 20.02.2021.
//

import UIKit
import Alamofire

class MovieViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = MovieViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }
        
    private func loadPopularMoviesData() {
        viewModel.fetchPopularMoviesData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numverOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        
        else {
            fatalError("Unable to create movie table view cell")
        }
        
//        let movie = viewModel.cellForRowAt(indexPath: indexPath)
//        cell.setCellWithValuesOf(movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 305
    }
    
}
