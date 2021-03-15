//
//  UISearchBarDelegate.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import UIKit

extension MainView: UISearchBarDelegate {
    
    // Filter data of collectionView with input data of the searchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMovieArray = movieArray.filter { (movie) -> Bool in
            movie.original_title.lowercased().contains(searchText.lowercased())
        }
        if searchText == "" {
            filteredMovieArray = movieArray
        }
        collectionView.reloadData()
    }
}
