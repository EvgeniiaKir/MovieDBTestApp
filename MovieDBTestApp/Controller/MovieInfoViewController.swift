//
//  MovieInfoViewController.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import UIKit

class MovieInfoViewController: UIViewController {
    
    var movieInfoView: MovieInfoView!
    public var data = DetailedMovie()
    var backgroundAnimation = UIViewPropertyAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieInfoView = MovieInfoView(frame: CGRect.zero)
        self.view.backgroundColor = #colorLiteral(red: 0.6084811091, green: 0.604137361, blue: 0.6118094325, alpha: 0.6694907882)
        self.view.layer.opacity = 0
        
        loadData()
        
        movieInfoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieInfoView)
        NSLayoutConstraint.activate([
            movieInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieInfoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieInfoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieInfoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let gesBackgroundTap = UITapGestureRecognizer(target: self, action: #selector(closeAction))
        view.addGestureRecognizer(gesBackgroundTap)
        
        backgroundAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.view.layer.opacity = 1
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backgroundAnimation.startAnimation()
    }
    
    @objc func closeAction(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadData(){
        movieInfoView.backdropMovieImageView.imageFromUrl(urlString: "https://image.tmdb.org/t/p/w500/\(data.backdrop_path)")
        movieInfoView.movieNameLabel.text = data.title
        movieInfoView.posterImageView.imageFromUrl(urlString: "https://image.tmdb.org/t/p/w500/\(data.poster_path)")
        movieInfoView.releaseDateLabel.text = "Released: \(data.release_date)"
        movieInfoView.progressLayer.progress = CGFloat(data.vote_average/10)
        movieInfoView.overviewLabel.text?.append(data.overview)
        let rate = Int(data.vote_average * 10)
        movieInfoView.rateLabel.text = String(rate)
    }
}
