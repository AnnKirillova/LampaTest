//
//  HeaderView.swift
//  LampaTest
//
//  Created by Ann on 08.07.2021.
//

import UIKit

protocol GoToDelegate: AnyObject {
    func goTo(page: Page)
    func toSearch(next: Search)
}

enum Page{
    case storiesPage
    case videoPage
    case favouritesPage
}

enum Search {
    case toSearch
}

class HeaderView: UIView {
    var numOfBtn = 0
   weak var delegate: GoToDelegate?
    
    @IBOutlet weak var favouriresBottomLine: UIImageView!
    @IBOutlet weak var videoBottomLine: UIImageView!
    @IBOutlet weak var storiesBottomLine: UIImageView!
    
    @IBOutlet weak var storiesBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var favouriresBtn: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("HeaderView", owner:self, options: nil)! [0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    @IBAction func storiesAction(_ sender: UIButton) {
        delegate?.goTo(page: .storiesPage)
        select(page: .storiesPage)
    }
    
    @IBAction func videoAction(_ sender: UIButton) {
        delegate?.goTo(page: .videoPage)
        select(page: .videoPage)
    }
    
    @IBAction func favouritesAction(_ sender: Any) {
        delegate?.goTo(page: .favouritesPage)
        select(page: .favouritesPage)
    }
    
    func setCurrentPage(page: Page) {
        select(page: page)
    }
    
    func select(page: Page){
        let baseColor = UIColor.lightGray
        let baseColorBottomLine = UIColor.clear.cgColor
        let selectedColor = UIColor.white
        
        videoBtn.setTitleColor(baseColor, for: .normal)
        videoBottomLine.layer.backgroundColor = baseColorBottomLine
        favouriresBtn.setTitleColor(baseColor, for: .normal)
        favouriresBottomLine.layer.backgroundColor = baseColorBottomLine
        storiesBtn.setTitleColor(baseColor, for: .normal)
        storiesBottomLine.layer.backgroundColor = baseColorBottomLine
        
        switch page {
        case .favouritesPage:
            favouriresBtn.setTitleColor(selectedColor, for: .normal)
            favouriresBottomLine.layer.backgroundColor = selectedColor.cgColor
        case .storiesPage:
            storiesBtn.setTitleColor(selectedColor, for: .normal)
            storiesBottomLine.layer.backgroundColor = selectedColor.cgColor
        case .videoPage:
            videoBtn.setTitleColor(selectedColor, for: .normal)
            videoBottomLine.layer.backgroundColor = selectedColor.cgColor
        }
    }
    
    @IBAction func searchAction(_ sender: Any) {
        delegate?.toSearch(next: .toSearch)
    }
}

