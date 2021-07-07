//
//  TableViewCell.swift
//  LampaTest
//
//  Created by Ann on 07.07.2021.
//

import UIKit

class topFilmCell: UITableViewCell {

    @IBOutlet weak var top: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        top.layer.cornerRadius = 11
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
