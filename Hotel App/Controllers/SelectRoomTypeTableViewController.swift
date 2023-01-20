//
//  SelectRoomTypeTableViewController.swift
//  Hotel App
//
//  Created by Tolga Sarikaya on 14.01.23.
//

import UIKit

protocol SelectRoomTypeTableViewControllerDelegate: class {
    
    func didSelect(roomType: RoomType)
}

class SelectRoomTypeTableViewController: UITableViewController {

    // MARK: - UI Elements
    
    
    
    // MARK: - Properties
    var selectedRoomType: RoomType?
    weak var delegate: SelectRoomTypeTableViewControllerDelegate?
    
    var roomName = [String]()
    var roomImage = [UIImage]()
    
    var choosenRoomTypeName = ""
    var choosenRoomImage = UIImage()
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "roomBackground.jpeg"))
        
        roomName.append("Two Queen")
        roomName.append("One King")
        roomName.append("Suit")
        
        roomImage.append(UIImage(named: "Queen.jpg")!)
        roomImage.append(UIImage(named: "One King.jpg")!)
        roomImage.append(UIImage(named: "suit.jpg")!)

        
        
    }


    // MARK: - Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Here we specify how many cells should be in the list element.
        return RoomType.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        // We set which value we should use according to which cell is in the list element with the value defined here.
        let roomType = RoomType.all[indexPath.row]
        
        cell.textLabel?.text = roomType.name
        cell.detailTextLabel?.text = "$ \(roomType.price)"
        
        /*
        // Is the currently drawn room type the previously selected room type?
        if roomType == selectedRoomType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
         */
        
        return cell
         
    }
       
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Here it is interacting with the values ​​inside the other ViewController element.
        tableView.deselectRow(at: indexPath, animated: true)
        selectedRoomType = RoomType.all[indexPath.row]
        delegate?.didSelect(roomType: selectedRoomType!)
        
        choosenRoomTypeName = roomName[indexPath.row]
        choosenRoomImage = roomImage[indexPath.row]
        performSegue(withIdentifier: "toRoomImage", sender: nil)
        
       
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRoomImage" {
            let destinatonVC = segue.destination as! RoomImageViewController
            destinatonVC.selectedRoomImage = choosenRoomImage
            destinatonVC.selectedRoomTypeNameLabel = choosenRoomTypeName
        }
    }
    
   
    

 
    
    
    // MARK: - Actions
    
}
