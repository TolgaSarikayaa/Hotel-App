//
//  RegistrationTableViewController.swift
//  Hotel App
//
//  Created by Tolga Sarikaya on 13.01.23.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    
    
    
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Functions

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    

}
