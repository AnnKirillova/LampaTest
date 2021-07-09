//
//  PageController.swift
//  LampaTest
//
//  Created by Ann on 07.07.2021.
//

import UIKit

class PageController: UIPageViewController, UIPageViewControllerDataSource, GoToDelegate {
    
    let headerView = HeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([goToStories()], direction: .forward, animated: false, completion: nil)
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 135)
        headerView.delegate = self
        self.view.addSubview(headerView)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func goToStories() -> StoriesController{
        let vc = storyboard!.instantiateViewController(identifier: "StoriesController") as! StoriesController
        return vc
    }
    func goToVideo() -> VideoController {
        let vc = storyboard!.instantiateViewController(identifier: "VideoController") as! VideoController
        return vc
    }
    func goToFavourites() -> FavouritesController {
        let vc = storyboard!.instantiateViewController(identifier: "FavouritesController") as! FavouritesController
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController is StoriesController{
            headerView.setCurrentPage(page: .StoriesPage)
            return nil
        } else if viewController is VideoController{
            headerView.setCurrentPage(page: .VideoPage)
            return goToStories()
        } else {
            headerView.setCurrentPage(page: .FavouritesPage)
            return goToVideo()
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController is StoriesController{
            headerView.setCurrentPage(page: .StoriesPage)
            return goToVideo()
        } else if viewController is VideoController{
            headerView.setCurrentPage(page: .VideoPage)
            return goToFavourites()
        }else{
            headerView.setCurrentPage(page: .FavouritesPage)
            return nil
        }
    
    }
    func goTo(page: Pages) {
        switch page {
        case .StoriesPage:
            setViewControllers([goToStories()], direction: .forward, animated: false, completion: nil)
        case .VideoPage:
            setViewControllers([goToVideo()], direction: .forward, animated: false, completion: nil)
        case .FavouritesPage:
            setViewControllers([goToFavourites()], direction: .forward, animated: false, completion: nil)
    }
}
    func toSearch(next: Search) {
        let story = self.storyboard!
        let vc = story.instantiateViewController(identifier: "SearchController") as! SearchController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
