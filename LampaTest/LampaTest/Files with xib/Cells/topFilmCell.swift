//
//  TableViewCell.swift
//  LampaTest
//
//  Created by Ann on 07.07.2021.
//

import UIKit
import Kingfisher

class topFilmCell: UITableViewCell {

    @IBOutlet weak var top: UIView!
    @IBOutlet weak var nameOfTopFilm: UILabel!
    @IBOutlet weak var imageOfTopFilm: UIImageView!
    @IBOutlet weak var linkOfMovies: UITextView!
    @IBOutlet weak var dateOfTopFilm: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        top.layer.cornerRadius = 11
        
    }
    
    func set(movie: Movie){
        nameOfTopFilm.text = movie.original_title
        dateOfTopFilm.text = movie.release_date
        let imgURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")
        imageOfTopFilm.kf.setImage(with: imgURL)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func prepareView(){
        let urlPolicy = URL(string: "https://www.themoviedb.org")!
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(attributedString: linkOfMovies.attributedText!)
        attributedString.setAttributes([.link: urlPolicy], range: NSRange(location: 0, length: 25))
    }
}
