//
//  StoryboardPageViewController.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 5.10.21.
//

import UIKit

class StoryboardPageViewController: UIPageViewController, UIScrollViewDelegate {
    
    weak var customDelegate: CustomPageViewControllerDelegate?
    
    lazy var viewC: ViewController = {
        let viewC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc") as! ViewController
        return viewC
    }()
    
    lazy var firstVC: StoryboardViewController = {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storyboardid") as! StoryboardViewController
        vc.imageString = ImageString.firstVC.rawValue
        vc.largeLabelString = LargeLabelString.firstVC.rawValue
        vc.smallLabelString = SmallLabelString.firstVC.rawValue
     
        return vc
    }()
    
    lazy var secondVC: StoryboardViewController = {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storyboardid") as! StoryboardViewController
        vc.imageString = ImageString.secondVC.rawValue
        vc.largeLabelString = LargeLabelString.secondVC.rawValue
        vc.smallLabelString = SmallLabelString.secondVC.rawValue
  
        return vc
    }()
    
    lazy var thirdVC: StoryboardViewController = {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storyboardid") as! StoryboardViewController
        vc.imageString = ImageString.thirdVC.rawValue
        vc.largeLabelString = LargeLabelString.thirdVC.rawValue
        vc.smallLabelString = SmallLabelString.thirdVC.rawValue
    
        return vc
    }()
    
    var orderedViewControllers = [StoryboardViewController]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
                        
        orderedViewControllers.append(firstVC)
        orderedViewControllers.append(secondVC)
        orderedViewControllers.append(thirdVC)
 
        customDelegate?.numberOfPage(numberOfPage: orderedViewControllers.count)

        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                animated: true,
                completion: nil)
        }
        
    }
}

extension StoryboardPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
      if let currentPageViewController = pageViewController.viewControllers?.first as? StoryboardViewController {
        let index = orderedViewControllers.firstIndex(of: currentPageViewController)!
        viewC.pageControl.currentPage = index
      }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let indexVC = orderedViewControllers.firstIndex(of: viewController as! StoryboardViewController), indexVC > 0 else {
            return nil
        }
        let before = indexVC - 1
        
        return orderedViewControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let indexVC = orderedViewControllers.firstIndex(of: viewController as! StoryboardViewController), indexVC < (orderedViewControllers.count - 1) else {
            return nil
        }
        
        let after = indexVC + 1
        
        return orderedViewControllers[after]
    }
    
}


