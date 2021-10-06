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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let desinationViewController = segue.destination as? StoryboardPageViewController {
        desinationViewController.delegate = self
        desinationViewController.dataSource = self
       }
     }
    
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    
          if let currentPageViewController = pageViewController.viewControllers?.first as? StoryboardViewController {
            let index = StoryboardPageViewController.orderedViewControllers.firstIndex(of: currentPageViewController)!
            pageControl.currentPage = index
          }
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

