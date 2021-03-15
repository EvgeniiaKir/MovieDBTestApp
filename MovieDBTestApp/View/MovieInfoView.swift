//
//  MovieInfoView.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import UIKit

class MovieInfoView: UIView {
    
    public var data = DetailedMovie()
    let view: UIView = UIView()

    let backgroundView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 13
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var backdropMovieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var darkBlurImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.200255692, green: 0.1988317072, blue: 0.2013503313, alpha: 0.83)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let posterImageView: UIImageView = {
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
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let movieNameLabel = UILabel(text: "Default movie", font: .sfProDisplay(36), color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    let releaseDateLabel = UILabel(text: "Released: 19 Dec 2001", font: .sfProDisplay(14), color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    let rateLabel = UILabel(text: "80", font: .sfProDisplay(18), color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    let userLabel = UILabel(text: "User Score", font: .sfProDisplay(18), color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    let overviewLabel = UILabel(text: "Overview:\n", font: .sfProDisplay(18), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
      }

      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      }
    
    private func setupUI(){
        view.backgroundColor = .clear
        movieNameLabel.numberOfLines = 3
        overviewLabel.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view)
        view.addSubview(backgroundView)
        backgroundView.addSubview(backdropMovieImageView)
        backdropMovieImageView.addSubview(darkBlurImageView)
        backgroundView.addSubview(movieNameLabel)
        backgroundView.addSubview(posterImageView)
        backgroundView.addSubview(releaseDateLabel)
        backgroundView.addSubview(circleRateView)
        circleRateView.addSubview(progressLayer)
        circleRateView.addSubview(rateLabel)
        backgroundView.addSubview(userLabel)
        backgroundView.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(overviewLabel)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])

        NSLayoutConstraint.activate([
            backdropMovieImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            backdropMovieImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            backdropMovieImageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            backdropMovieImageView.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        NSLayoutConstraint.activate([
            darkBlurImageView.topAnchor.constraint(equalTo: self.topAnchor),
            darkBlurImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            darkBlurImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            darkBlurImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            movieNameLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            movieNameLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            posterImageView.bottomAnchor.constraint(equalTo: backdropMovieImageView.bottomAnchor, constant: 25),
            posterImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            posterImageView.widthAnchor.constraint(equalToConstant: 100),
            posterImageView.heightAnchor.constraint(equalToConstant: 150)
        ])

        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 25),
            releaseDateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            releaseDateLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])

        
        NSLayoutConstraint.activate([
            circleRateView.bottomAnchor.constraint(equalTo: backdropMovieImageView.bottomAnchor, constant: -10),
            circleRateView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
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
            userLabel.leadingAnchor.constraint(equalTo: circleRateView.trailingAnchor, constant: 10),
            userLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            userLabel.centerYAnchor.constraint(equalTo: circleRateView.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: backdropMovieImageView.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            overviewLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
}
