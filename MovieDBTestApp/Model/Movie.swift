//
//  Movie.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import UIKit

struct Movies: Hashable, Codable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
}

struct Movie: Hashable, Codable {
    var original_title: String
    var title: String
    var release_date: String
    var poster_path: String
    var vote_average: Double
    var backdrop_path: String
    var overview: String
}

struct Genres: Hashable, Codable {
    var id: Int
    var name: String
}

public struct DetailedMovie {
    var original_title: String = ""
    var title: String = ""
    var release_date: String = ""
    var poster_path: String = ""
    var vote_average: Double = 0.0
    var backdrop_path: String = ""
    var overview: String = ""
    var page: Int = 1
}
