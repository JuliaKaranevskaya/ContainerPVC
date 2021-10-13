//
//  SplashViewController.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 6.10.21.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var backToMainScreenButton: UIButton!
    

    @IBOutlet weak var logoImage: UIImageView!
    
    static let logoImage = UIImage(named: "logoImage")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backToMainScreenButton.setTitle("Back to Main Screen", for: .normal)
        
    }
    
    @IBAction func backToMainScreenButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    


}
