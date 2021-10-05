//
//  ViewController.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 5.10.21.
//

import UIKit

class ViewController: UIViewController, CustomPageViewControllerDelegate {
    
    var customPageViewController: StoryboardPageViewController?

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    
    var buttonTitleString: String?
    var hideTheButton = false
    var numberOfPage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let customPageViewController = customPageViewController else {
            return
        }
                
        customPageViewController.customDelegate = self
        
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
}

