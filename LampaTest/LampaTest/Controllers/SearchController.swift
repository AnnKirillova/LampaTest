//
//  SearchController.swift
//  LampaTest
//
//  Created by Ann on 09.07.2021.
//

import UIKit

class SearchController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableOfSearchFilms: UITableView!
    
    let regularFilms = "regularFilmCell"
    private let searchController = UISearchController(searchResultsController: nil)
    private var filteredFilms = [Movie]()
    private var searchBarIsEmpty: Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var movies = [Movie]()
    let apiManager = APIManager()
    var isFiltering: Bool {
      return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Films"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        tableOfSearchFilms.register(UINib(nibName: regularFilms, bundle: nil), forCellReuseIdentifier: regularFilms)
        apiManager.getMovies { moviesResponse in
            DispatchQueue.main.async {
                self.movies = moviesResponse.results
                self.tableOfSearchFilms.reloadData()
            }
        }

    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return movies.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
          return filteredFilms.count
        }

        return movies.count
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: regularFilms, for: indexPath) as! RegularFilmCell
        var film: Movie
        if isFiltering{
            film = filteredFilms[indexPath.row]
        }else{
            film = movies[indexPath.row]
        }
        cell.set(movie: film)
        return cell
    }
  

}

extension SearchController: UISearchResultsUpdating {
    
  func updateSearchResults(for searchController: UISearchController) {
    filterContentForSearchText(searchController.searchBar.text!)
  }
   private func filterContentForSearchText(_ searchText: String) {
      filteredFilms = movies.filter { (movie: Movie) -> Bool in
        return movie.original_title.lowercased().contains(searchText.lowercased())
      }
    tableOfSearchFilms.reloadData()
    }

}

