//
//  PageController.swift
//  LampaTest
//
//  Created by Ann on 07.07.2021.
//

import UIKit

protocol UnboardingDelegate: class{
    func go(to number: Int)
}

class PageController: UIPageViewController, UIPageViewControllerDataSource, UnboardingDelegate {

    var page = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([goToStories()], direction: .forward, animated: false, completion: nil)
    }
    func goToStories() -> StoriesController{
        let vc = storyboard!.instantiateViewController(identifier: "StoriesController") as! StoriesController
//        vc.delegate = self
        return vc
    }
    func goToVideo() -> VideoController {
        let vc = storyboard!.instantiateViewController(identifier: "VideoController") as! VideoController
//        vc.delegate = self
        return vc
    }
    func goToFavourites() -> FavouritesController {
        let vc = storyboard!.instantiateViewController(identifier: "FavouritesController") as! FavouritesController
//        vc.delegate = self
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController is StoriesController{
            return nil
        } else if viewController is VideoController{
            return goToStories()
        } else {
            return goToVideo()
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController is StoriesController{
            return goToVideo()
        } else if viewController is VideoController{
            return goToFavourites()
        }else{
            return nil
        }
    }
    
    func go(to number: Int) {
        if number == 0 {
            page = 0
            setViewControllers([goToStories()], direction: .forward, animated: true, completion: nil)
        } else if number == 1{
            page = 1
            setViewControllers([goToVideo()], direction: .forward, animated: true, completion: nil)
        } else {
            page = 2
            setViewControllers([goToFavourites()], direction: .forward, animated: true, completion: nil)
        }
    }
}
   
