//
//  HeaderView.swift
//  LampaTest
//
//  Created by Ann on 08.07.2021.
//

import UIKit

protocol GoToDelegate {
    func goTo(page: Pages)
    func toSearch(next: Search)
}

enum Pages{
    case StoriesPage
    case VideoPage
    case FavouritesPage
    
}

enum Search {
    case toSearch
}

class HeaderView: UIView {
    var numOfBtn = 0
     var delegate: GoToDelegate?
    
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var storiesBtnOutlet: UIButton!
    @IBOutlet weak var videoBtnOutlet: UIButton!
    @IBOutlet weak var favouriresBtnOutlet: UIButton!
    
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
    @IBAction func storiesBtn(_ sender: UIButton) {
        delegate?.goTo(page: .StoriesPage)
        img1.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        img2.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
        img3.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
        videoBtnOutlet.setTitleColor(.lightGray, for: .normal)
        favouriresBtnOutlet.setTitleColor(.lightGray, for: .normal)
        storiesBtnOutlet.setTitleColor(.white, for: .normal)
        
        
    }
    
    @IBAction func videoBtn(_ sender: UIButton) {
        delegate?.goTo(page: .VideoPage)
        img2.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        img1.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
        img3.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
        videoBtnOutlet.setTitleColor(.white, for: .normal)
        favouriresBtnOutlet.setTitleColor(.lightGray, for: .normal)
        storiesBtnOutlet.setTitleColor(.lightGray, for: .normal)
        
    }
    
    @IBAction func favouritesBtn(_ sender: Any) {
        delegate?.goTo(page: .FavouritesPage)
        img3.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        img2.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
        img1.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
        videoBtnOutlet.setTitleColor(.lightGray, for: .normal)
        favouriresBtnOutlet.setTitleColor(.white, for: .normal)
        storiesBtnOutlet.setTitleColor(.lightGray, for: .normal)
        
    }
    
    func setCurrentPage(page: Pages) {
        switch page {
        case .StoriesPage:
            img1.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            img2.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
            img3.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
            videoBtnOutlet.setTitleColor(.lightGray, for: .normal)
            favouriresBtnOutlet.setTitleColor(.lightGray, for: .normal)
            storiesBtnOutlet.setTitleColor(.white, for: .normal)
        case .VideoPage:
            img2.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            img1.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
            img3.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
            videoBtnOutlet.setTitleColor(.white, for: .normal)
            favouriresBtnOutlet.setTitleColor(.lightGray, for: .normal)
            storiesBtnOutlet.setTitleColor(.lightGray, for: .normal)
        case .FavouritesPage:
            img3.layer.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
            img2.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
            img1.layer.backgroundColor = CGColor.init(red: 170/225, green: 170/225, blue: 170/225, alpha: 0)
            videoBtnOutlet.setTitleColor(.lightGray, for: .normal)
            favouriresBtnOutlet.setTitleColor(.white, for: .normal)
            storiesBtnOutlet.setTitleColor(.lightGray, for: .normal)
        }
    }
    @IBAction func searchAct(_ sender: Any) {
        delegate?.toSearch(next: .toSearch)
    }
    
}
//топ шрифт и цвет даты, 
// делегаты для передачи инфы, на какую кнопку нажали go to, энам для куда

