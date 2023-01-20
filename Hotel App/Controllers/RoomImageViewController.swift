//
//  RoomImageTableViewController.swift
//  Hotel App
//
//  Created by Tolga Sarikaya on 17.01.23.
//

import UIKit

class RoomImageViewController: UIViewController {

    
    // MARK: - UI Elements
    
    @IBOutlet weak var imageView : UIImageView!
    
    @IBOutlet weak var roomTypeName: UILabel!
    
    // MARK: - Properties

    var selectedRoomImage = UIImage()
    var selectedRoomTypeNameLabel = ""
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
   
        roomTypeName.text = selectedRoomTypeNameLabel
        imageView.image = selectedRoomImage
        
        
        
    }

}
