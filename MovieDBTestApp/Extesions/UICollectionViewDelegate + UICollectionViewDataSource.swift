//
//  UICollectionViewDelegate + UICollectionViewDataSource.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import UIKit

extension MainView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Cells amount
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMovieArray.count
    }
    
    // Fill cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let currentMovie = filteredMovieArray[indexPath.row]
        cell.movieName.text = currentMovie.title
        cell.movieDate.text = currentMovie.release_date
        cell.movieImageView.imageFromUrl(urlString: "https://image.tmdb.org/t/p/w500/\(currentMovie.poster_path)")
        cell.progressLayer.progress = CGFloat(currentMovie.vote_average/10)
        let rate = Int(currentMovie.vote_average * 10)
        cell.rateLabel.text = String(rate)

        return cell
    }
    
    // Cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.2, height: collectionView.frame.width/0.95)
    }
    
    //Move to another controller
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = filteredMovieArray[indexPath.row]
        self.delegate?.showMovieInfoController(movie: movie)
    }
}

