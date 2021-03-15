//
//  MovieCell.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseId = "MovieCell"
    
    let movieImageView: UIImageView = {
        let movieImg = UIImageView()
        movieImg.backgroundColor = .none
        movieImg.translatesAutoresizingMaskIntoConstraints = false
        movieImg.contentMode = .scaleAspectFill
        movieImg.clipsToBounds = true
        movieImg.layer.cornerRadius = 6
        return movieImg
    }()
    
    let circleRateView: UIView = {
        let circleView = UIView()
        circleView.layer.cornerRadius = 20
        circleView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        return circleView
    }()
    
    let progressLayer: CircularProgressView = {
        let shapeLayer = CircularProgressView()
        shapeLayer.progress = 0.25
        shapeLayer.translatesAutoresizingMaskIntoConstraints = false

        return shapeLayer
    }()
    
    let movieName: UILabel = {
        let title = UILabel(text: "Movie name", font: .sfProDisplay(18), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        return title
    }()
    
    let movieDate: UILabel = {
        let title = UILabel(text: "19 Dec 2001", font: .sfProDisplay(14), color: #colorLiteral(red: 0.3960784314, green: 0.3921568627, blue: 0.4235294118, alpha: 1))
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let rateLabel = UILabel(text: "80", font: .sfProDisplay(18), color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        backgroundColor = .none
        layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup constraints
extension MovieCell {
    private func setupUI() {

        rateLabel.translatesAutoresizingMaskIntoConstraints = false        

        addSubview(movieImageView)
        addSubview(circleRateView)
        circleRateView.addSubview(progressLayer)
        circleRateView.addSubview(rateLabel)
        addSubview(movieName)
        addSubview(movieDate)

        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: self.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.5)
        ])
        
        NSLayoutConstraint.activate([
            circleRateView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -20),
            circleRateView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            circleRateView.heightAnchor.constraint(equalToConstant: 40),
            circleRateView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            progressLayer.centerXAnchor.constraint(equalTo: circleRateView.centerXAnchor),
            progressLayer.centerYAnchor.constraint(equalTo: circleRateView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rateLabel.centerXAnchor.constraint(equalTo: circleRateView.centerXAnchor),
            rateLabel.centerYAnchor.constraint(equalTo: circleRateView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),
            movieName.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieName.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            movieDate.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 5),
            movieDate.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieDate.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
