//
//  PageController.swift
//  LampaTest
//
//  Created by Ann on 07.07.2021.
//

import UIKit

class PageController: UIPageViewController, UIPageViewControllerDataSource {
    
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let headerView = HeaderView()
    
    lazy var storiesVC: StoriesController = {
        let vc = storyboard!.instantiateViewController(withIdentifier: "StoriesController") as! StoriesController
        return vc
    }()
    lazy var videoVC: VideoController = {
        let vc = storyboard!.instantiateViewController(withIdentifier: "VideoController") as! VideoController
        return vc
    }()
    lazy var favouritesVC: FavouritesController = {
        let vc = storyboard!.instantiateViewController(withIdentifier: "FavouritesController") as! FavouritesController
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStatusBarBackgroundView(viewController: self)
        dataSource = self
        setViewControllers([storiesVC], direction: .forward, animated: false, completion: nil)
        setupHeader()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupHeader(){
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 135)
        headerView.delegate = self
        self.view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([NSLayoutConstraint(item: headerView,
                                                                attribute: .top,
                                                                relatedBy: .equal,
                                                                toItem: self.view.safeAreaLayoutGuide,
                                                                attribute: .top,
                                                                multiplier: 1,
                                                                constant: 0),
                                             NSLayoutConstraint(item: headerView,
                                                                attribute: .left,
                                                                relatedBy: .equal,
                                                                toItem: self.view,
                                                                attribute: .left,
                                                                multiplier: 1,
                                                                constant: 0),
                                             NSLayoutConstraint(item: headerView,
                                                                attribute: .right,
                                                                relatedBy: .equal,
                                                                toItem: self.view,
                                                                attribute: .right,
                                                                multiplier: 1,
                                                                constant: 0)])
        let blackView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        blackView.backgroundColor = .green
        self.view.addSubview(blackView)
        blackView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([NSLayoutConstraint(item: blackView,
                                                                attribute: .top,
                                                                relatedBy: .equal,
                                                                toItem: self.view,
                                                                attribute: .top,
                                                                multiplier: 1,
                                                                constant: 0),
                                             NSLayoutConstraint(item: blackView,
                                                                attribute: .left,
                                                                relatedBy: .equal,
                                                                toItem: self.view,
                                                                attribute: .left,
                                                                multiplier: 1,
                                                                constant: 0),
                                             NSLayoutConstraint(item: blackView,
                                                                attribute: .right,
                                                                relatedBy: .equal,
                                                                toItem: self.view,
                                                                attribute: .right,
                                                                multiplier: 1,
                                                                constant: 0),
                                             NSLayoutConstraint(item: blackView,
                                                                attribute: .bottom,
                                                                relatedBy: .equal,
                                                                toItem: self.view.safeAreaLayoutGuide,
                                                                attribute: .top,
                                                                multiplier: 1,
                                                                constant: 0)])
        blackView.backgroundColor = UIColor(displayP3Red: 19.0/255.0, green: 19.0/255.0, blue: 19.0/255.0, alpha: 1)
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController is StoriesController{
            headerView.setCurrentPage(page: .storiesPage)
            return nil
        } else if viewController is VideoController{
            headerView.setCurrentPage(page: .videoPage)
            return storiesVC
        } else {
            headerView.setCurrentPage(page: .favouritesPage)
            return videoVC
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController is StoriesController{
            headerView.setCurrentPage(page: .storiesPage)
            return videoVC
        } else if viewController is VideoController{
            headerView.setCurrentPage(page: .videoPage)
            return favouritesVC
        }else{
            headerView.setCurrentPage(page: .favouritesPage)
            return nil
        }
        
    }
}

extension PageController: GoToDelegate{
    
    func goTo(page: Page) {
        switch page {
        case .storiesPage:
            setViewControllers([storiesVC], direction: .forward, animated: false, completion: nil)
        case .videoPage:
            setViewControllers([videoVC], direction: .forward, animated: false, completion: nil)
        case .favouritesPage:
            setViewControllers([favouritesVC], direction: .forward, animated: false, completion: nil)
        }
    }
    
    func toSearch(next: Search) {
        let story = self.storyboard!
        let vc = story.instantiateViewController(withIdentifier: "SearchController") as! SearchController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PageController {
    func addStatusBarBackgroundView(viewController: UIViewController) -> Void {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size:CGSize(width: SCREEN_WIDTH, height:20))
        let view : UIView = UIView.init(frame: rect)
        view.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1) //Replace value with your required background color
        viewController.view?.addSubview(view)
    }
}
