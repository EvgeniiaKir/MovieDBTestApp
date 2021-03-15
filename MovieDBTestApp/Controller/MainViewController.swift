//
//  ViewController.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import UIKit

class MainViewController: UIViewController, movieViewDelegate {

    var movieView: MainView!
    let apiManager = ApiManager()
    var page = Int()
    var totalPages = Int()
    var movieArrayRefreshed = false

    override func viewDidLoad() {
        super.viewDidLoad()
        movieView = MainView(frame: CGRect.zero)
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        movieView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(movieView)
        NSLayoutConstraint.activate([
            movieView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
                
        loadPageData(page: 1)

        movieView.delegate = self
        movieView.pageController.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .valueChanged)
    }

    @objc func pageControlTapHandler(sender:UIPageControl) {
        loadPageData(page: sender.currentPage + 1)
    }
    
    //MARK: - Helpers
    func showMovieInfoController(movie: DetailedMovie) {
        let movieInfoViewController = MovieInfoViewController()
        movieInfoViewController.modalPresentationStyle = .custom
        movieInfoViewController.data = movie
        present(movieInfoViewController, animated: true, completion: nil)
    }
    
    func fillDetailedMovieStruct(json: Movie) -> DetailedMovie {
        let original_title = json.original_title
        let title = json.title
        let vote_average = json.vote_average
        let poster_path = json.poster_path
        let backdrop_path = json.backdrop_path
        let overview = json.overview
        var release_date = json.release_date
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM yyyy"
        
        if let date = dateFormatterGet.date(from: json.release_date) {
            release_date = dateFormatterPrint.string(from: date)
        } else {
            print("There was an error decoding the string")
        }
        
        return DetailedMovie(original_title: original_title, title: title, release_date: release_date, poster_path: poster_path, vote_average: vote_average, backdrop_path: backdrop_path, overview: overview, page: page)
    }
    
    func loadPageData(page: Int){
        let url = apiManager.fillURLArray(voteAverage: 8.0, voteCount: 100, page: page)
        movieView.movieArray.removeAll()
        apiManager.getJson(url: url){ (json) in
            for i in 0..<json.results.count{
                let movie = self.fillDetailedMovieStruct(json: json.results[i])
                self.movieView.movieArray.append(movie)
                self.page = json.page
                self.totalPages = json.total_pages
            }
            
            DispatchQueue.main.async {
                self.movieView.movieArray.sort{ (a, b) -> Bool in
                    return a.original_title < b.original_title
                }
                self.movieView.filteredMovieArray = self.movieView.movieArray
                self.movieView.pageController.numberOfPages = self.totalPages
                self.movieView.collectionView.reloadData()
            }
        }
    }
}

