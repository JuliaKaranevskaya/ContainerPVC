//
//  StoryboardViewController.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 5.10.21.
//

import UIKit

class StoryboardViewController: UIViewController {
    
    @IBOutlet weak var orangeImage: UIImageView!
    @IBOutlet weak var largeLabel: UILabel!
    @IBOutlet weak var smallLabel: UILabel!
    
    var imageString: String?
    var largeLabelString: String?
    var smallLabelString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orangeImage.image = UIImage(named: imageString ?? "")
        largeLabel.text = largeLabelString
        smallLabel.text = smallLabelString

    }
}

