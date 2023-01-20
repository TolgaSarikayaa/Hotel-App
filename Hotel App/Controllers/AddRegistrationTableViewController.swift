//
//  RegistrationTableViewController.swift
//  Hotel App
//
//  Created by Tolga Sarikaya on 13.01.23.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController , SelectRoomTypeTableViewControllerDelegate {
  
    

    // MARK: - UI Elements
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var CheckOutPicker: UIDatePicker!
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    
    // MARK: - Properties
    var roomType: RoomType?
    
    var registration: Registration? {
        guard let roomType = roomType else { return nil }
        
        // Here we define the properties of the Registration object that we will create.
        let firstName = FirstNameTextField.text!
        let lastName = LastNameTextField.text!
        let email = EmailTextField.text!
        let checkInDate = checkInDatePicker.date
        let checkOutDate = CheckOutPicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
       
        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hasWifi)
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the CheckIn date to today's night.
        let midnightToday = Calendar.current.startOfDay(for: Date())

        // Sets the smallest date that can be selected.
        checkInDatePicker.minimumDate = midnightToday
        //Sets the currently selected date.
        checkInDatePicker.date = midnightToday
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "background.png"))
        
        updateDateViews()
        
        // Updates the temporary values ​​we set in the Storyboard with the current ten Stepper values.
        updateNumberOfGuest()
        
        updateRoomType()
    }

    // MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectRoomType" {
            let destination = segue.destination as? SelectRoomTypeTableViewController
            destination?.delegate = self
            destination?.selectedRoomType = roomType
         
        }
    }
    
    
    func updateDateViews() {
        
        // For a minimum stay of 1 night in hotel; CheckOutDatePicker's minimum date should be set 24 hours after the currently selected check-in date.
        let oneDay: Double = 24 * 60 * 60
        CheckOutPicker.minimumDate = checkInDatePicker.date.addingTimeInterval(oneDay)
        
    }
    
    func updateNumberOfGuest() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
   func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        }else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }

    
    
    // MARK: - Actions
  @IBAction func datePickerValueChanged(_ picker: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ stepper: UIStepper) {
        updateNumberOfGuest()
    }

    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        
    }
    
    @IBAction func cancelBarButtonTapped(_ button: UIBarButtonItem) {
        
        // When this button is pressed, we run this function for our application to go back.
        dismiss(animated: true, completion: nil)
    }
}
