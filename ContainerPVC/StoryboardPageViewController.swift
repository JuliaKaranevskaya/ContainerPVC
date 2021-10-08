//
//  StoryboardPageViewController.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 5.10.21.
//

import UIKit

class StoryboardPageViewController: UIPageViewController, UIScrollViewDelegate {
    
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
    
    static var orderedViewControllers = [StoryboardViewController]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        StoryboardPageViewController.orderedViewControllers.append(firstVC)
        StoryboardPageViewController.orderedViewControllers.append(secondVC)
        StoryboardPageViewController.orderedViewControllers.append(thirdVC)
 
        if let firstViewController = StoryboardPageViewController.orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                animated: true,
                completion: nil)
        }
        
    }
}


    



