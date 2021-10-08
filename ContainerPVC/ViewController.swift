//
//  ViewController.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 5.10.21.
//

import UIKit

/*
 - по нажатию кнопок ничего не происходит
 + на последнем экране текст у кнопки должен быть другой
 + и чуть ниже должна быть кнопка
 + нет скругления белой вьюхи
 + поворот надо отключить
 - чтобы смена системной темы не влияла но приложение
 - проверить запуск приложения на iOS 12
 - текст на SE 1го поколения проверяла должен влазить
 + проверить оишбки констреинтов
 */

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    @IBOutlet weak var largeLabel: UILabel!
  
    @IBOutlet weak var smallLabel: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var roundedView: UIView!
    
    @IBOutlet weak var orangeButton: UIButton!
    
    @IBOutlet weak var whiteButton: UIButton!
    
    @IBOutlet weak var secondOrangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        roundedView.backgroundColor = UIColor(named: "roundedViewColor")
        largeLabel.textColor = UIColor(named: "labelBlackColor")
        smallLabel.textColor = UIColor(named: "labelBlackColor")
        orangeButton.layer.cornerRadius = 12
        orangeButton.clipsToBounds = true
        secondOrangeButton.layer.cornerRadius = 12
        secondOrangeButton.clipsToBounds = true
        whiteButton.layer.borderWidth = 2
        whiteButton.layer.cornerRadius = 12
        whiteButton.layer.borderColor = UIColor.systemOrange.cgColor
        orangeButton.translatesAutoresizingMaskIntoConstraints = false
        orangeButton.setTitle("Далее", for: .normal)
        whiteButton.setTitle("Пропустить", for: .normal)
        
        secondOrangeButton.isHidden = true
        
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
            
            if index == 2 {
                whiteButton.isHidden = true
                orangeButton.isHidden = true
                secondOrangeButton.isHidden = false
                secondOrangeButton.setTitle("Начать пользоваться", for: .normal)
            } else {
                whiteButton.isHidden = false
                secondOrangeButton.isHidden = true
                orangeButton.isHidden = false
            }
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

