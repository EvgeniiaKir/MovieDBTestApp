//
//  ApiManager.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import Foundation
import UIKit

final class ApiManager {

    var urlArray: [String] = []

    func fillURLArray(voteAverage: Double, voteCount: Int, page: Int) -> String {
        var url = "https://api.themoviedb.org/3/discover/movie?"
        let api_key = "274f828ad283bd634ef4fc1ee4af255f"
        url.append("&vote_average.gte=\(voteAverage)&vote_count.gte=\(voteCount)&api_key=\(api_key)&page=\(page)")
        
        return url
    }
    
    func getJson(url: String, completion: @escaping (Movies) -> ()){
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){ data, res, err in
            if let data = data {
                
                let decoder = JSONDecoder()
                do {
                    let json = try decoder.decode(Movies.self, from: data)
                    completion(json)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
