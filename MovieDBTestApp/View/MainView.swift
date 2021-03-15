//
//  File.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import UIKit

public protocol movieViewDelegate:  class {
    func showMovieInfoController(movie: DetailedMovie)
}

class MainView: UIView {
    open var delegate:movieViewDelegate?
    let apiManager = ApiManager()
    var movieArray: [DetailedMovie] = []
    var filteredMovieArray: [DetailedMovie] = []
    let view: UIView = UIView()
    var totalPages: Int = 1 {
        didSet { setupUI() }
    }

    let mainLabel: UILabel = {
        let title = UILabel(text: "Top Movies", font: .sfProDisplay(34), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Movie"
        searchBar.tintColor = .black
        searchBar.layer.borderColor = CGColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        searchBar.layer.borderWidth = 1
        searchBar.barStyle = .default
        searchBar.sizeToFit()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    let pageController: UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.backgroundColor = UIColor.clear
        pageControll.currentPage = 0
        pageControll.pageIndicatorTintColor = #colorLiteral(red: 0.7513779998, green: 0.7403472066, blue: 0.7404039502, alpha: 1)
        pageControll.currentPageIndicatorTintColor = #colorLiteral(red: 0.4522152543, green: 0.4892786145, blue: 0.5457679629, alpha: 1)
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        return pageControll
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .none
        cv.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        cv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cv.isScrollEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
      }

      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      }
    
    func setupUI(){
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addDoneButtonOnKeyboard()

        addSubview(view)
        view.addSubview(mainLabel)
        view.addSubview(searchBar)
        view.addSubview(pageController)
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            pageController.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            pageController.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            pageController.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            pageController.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: pageController.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(dissmissKeyboard))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.searchBar.inputAccessoryView = doneToolbar
    }
    
    @objc func dissmissKeyboard() {
        self.view.endEditing(false)
    }
}
