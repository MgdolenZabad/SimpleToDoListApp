//
//  ViewController.swift
//  ToDoList
//
//  Created by Mgdolen Zabad on 4/12/18.
//  Copyright © 2018 MgdolenZabad. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    //MARK : IBOutlets
    
    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var itemTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //MARK : Set ToDoListViewController as UItableView and TextField Delegate and data Source
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
        newItemTextField.delegate = self
        
    }

    //MARK : IBActions
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
    }
    

}

