//
//  StoriesController.swift
//  LampaTest
//
//  Created by Ann on 07.07.2021.
//

import UIKit


class StoriesController: UIViewController {
    
    let apiManager = APIManager()
    var movies = [Movie]()
    let topFilms = "TopFilmCell"
    let regularFilms = "RegularFilmCell"
    @IBOutlet weak var tableViewOfFilms: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        self.tableViewOfFilms.contentInset = UIEdgeInsets(top: 135, left: 0, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setUpTable(){
        tableViewOfFilms.register(UINib(nibName: topFilms, bundle: nil), forCellReuseIdentifier: topFilms)
        tableViewOfFilms.register(UINib(nibName: regularFilms, bundle: nil), forCellReuseIdentifier: regularFilms)
        
        apiManager.getMovies { moviesResponse in
            DispatchQueue.main.async {
                self.movies = moviesResponse.results
                self.tableViewOfFilms.reloadData()
            }
        }
    }
    
}

extension StoriesController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: topFilms, for: indexPath) as! TopFilmCell
            cell.set(movie: movies[indexPath.row])
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: regularFilms, for: indexPath) as! RegularFilmCell
            //rename 
            cell.set(movie: movies[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = self.storyboard!
        let vc = story.instantiateViewController(withIdentifier: "FilmController") as! FilmController
        vc.film = movies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

