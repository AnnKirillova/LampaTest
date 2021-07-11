//
//  FilmController.swift
//  LampaTest
//
//  Created by Ann on 08.07.2021.
//

import UIKit
import Kingfisher

class FilmController: UIViewController {

    var film: Movie?
    @IBOutlet weak var filmImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        guard let film = film else {
            return
        }
        set(movie: film)
    }
    
    func set(movie: Movie){
        let imgURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")
        filmImage.kf.setImage(with: imgURL)
        title = movie.original_title
    }
}
