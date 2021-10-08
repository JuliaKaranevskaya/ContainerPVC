//
//  StoryboardViewController.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 5.10.21.
//

import UIKit

class StoryboardViewController: UIViewController {
    
    @IBOutlet weak var orangeImage: UIImageView!
    
    var imageString: String?
    var largeLabelString: String?
    var smallLabelString: String?
    var radius: Int?
    var width: Int?
    var color: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orangeImage.image = UIImage(named: imageString ?? "")
        

    }
}

