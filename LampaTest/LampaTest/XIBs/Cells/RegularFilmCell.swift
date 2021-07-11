//
//  TableViewCell2.swift
//  LampaTest
//
//  Created by Ann on 07.07.2021.
//

import UIKit
import Kingfisher

class RegularFilmCell: UITableViewCell {
    
    @IBOutlet weak var posterOfFilm: UIImageView!
    @IBOutlet weak var nameOfFilm: UILabel!
    @IBOutlet weak var dateOfStart: UILabel!
    @IBOutlet weak var linkForMovie: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(movie: Movie){
        nameOfFilm.text = movie.original_title
        dateOfStart.text = movie.release_date
        let imgURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")
        posterOfFilm.kf.setImage(with: imgURL)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
