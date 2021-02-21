//
//  Movie.swift
//  Movieto
//
//  Created by Dilda Ezgi Metincan on 19.02.2021.
//
//  Movie.swift
//  MovieSo
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? newJSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let page: Int
    let results: [MovieResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieResult: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}









//// MARK: - Movie
//struct Movie: Codable, Identifiable {
//
//    let id: Int
//    let original_title: String
//    let title: String
//    let userTitle: String
//    let overview: String
//    let poster_path: String?
//    let backdrop_path: String?
//    let popularity: Float
//    let vote_average: Float
//    let vote_count: Int
//    let backdropPath: String?
//    let posterPath: String?
//
//
//
//    var backdropURL: URL {
//        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
//    }
//
//    var PosterURL: URL {
//        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
//    }
//
//    let release_date: String?
//    var releaseDate: Date? {
//        return release_date != nil ? Movie.dateFormatter.date(from: release_date!) : Date()
//    }
//
//    static let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyy-MM-dd"
//        return formatter
//    }()
//
//}
