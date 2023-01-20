//
//  RoomImageTableViewController.swift
//  Hotel App
//
//  Created by Tolga Sarikaya on 17.01.23.
//

import UIKit

class RoomImageViewController: UITableViewController {

    
    // MARK: - UI Elements
    
    @IBOutlet weak var imageView : UIImageView!
    
    
    // MARK: - Properties

    var selectedRoomImage = UIImage()
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
   
        
        imageView.image = selectedRoomImage
        
        
        
    }

}
