//
//  StoryboardPageViewController.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 5.10.21.
//

import UIKit

class StoryboardPageViewController: UIPageViewController, UIScrollViewDelegate {
    
    var mainVC: ViewController!
    
    lazy var firstVC: StoryboardViewController = {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storyboardid") as! StoryboardViewController
        vc.imageString = ImageString.firstVC.rawValue
        return vc
    }()
    
    lazy var secondVC: StoryboardViewController = {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storyboardid") as! StoryboardViewController
        vc.imageString = ImageString.secondVC.rawValue
        return vc
    }()
    
    lazy var thirdVC: StoryboardViewController = {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storyboardid") as! StoryboardViewController
        vc.imageString = ImageString.thirdVC.rawValue
        return vc
    }()
    
    //array of screens
    public var orderedViewControllers = [StoryboardViewController]()
    
    //style of pageVC
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderedViewControllers.append(firstVC)
        orderedViewControllers.append(secondVC)
        orderedViewControllers.append(thirdVC)
 
        //setting the firsr screen
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                animated: true,
                completion: nil)
        }
    }
}

extension StoryboardPageViewController {

    func goToNextPage() {
       guard let currentViewController = self.viewControllers?.first else { return }
       guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
       setViewControllers([nextViewController], direction: .forward, animated: false, completion: nil)
       
    }

    func goToPreviousPage() {
       guard let currentViewController = self.viewControllers?.first else { return }
       guard let previousViewController = dataSource?.pageViewController( self, viewControllerBefore: currentViewController ) else { return }
       setViewControllers([previousViewController], direction: .reverse, animated: false, completion: nil)
    }

}


    



