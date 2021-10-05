//
//  ViewController.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 5.10.21.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    
    var buttonTitleString: String?
    var hideTheButton = false
    var numberOfPage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        orangeButton.setTitle(buttonTitleString, for: .normal)
        whiteButton.isHidden = hideTheButton
        pageControl.currentPage = numberOfPage ?? 1
        
    }
    
    func numberOfPage(numberOfPage: Int) {
        pageControl.numberOfPages = numberOfPage
    }
    
    func pageChangedTo(index: Int) {
        pageControl.currentPage = index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let indexVC = StoryboardPageViewController.orderedViewControllers.firstIndex(of: viewController as! StoryboardViewController), indexVC > 0 else {
            return nil
        }
        let before = indexVC - 1
        
        return StoryboardPageViewController.orderedViewControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let indexVC = StoryboardPageViewController.orderedViewControllers.firstIndex(of: viewController as! StoryboardViewController), indexVC < (StoryboardPageViewController.orderedViewControllers.count - 1) else {
            return nil
        }
        
        let after = indexVC + 1
        
        return StoryboardPageViewController.orderedViewControllers[after]
    }
}

