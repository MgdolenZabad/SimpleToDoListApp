//
//  ViewController.swift
//  ToDoList
//
//  Created by Mgdolen Zabad on 4/12/18.
//  Copyright © 2018 MgdolenZabad. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    //MARK - Call the Item Objects
    var itemArray = [Item]()
    
    
    //MARK - IBOutlets
    
    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //MARK - Set ToDoListViewController as UItableView and TextField Delegate and data Source
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
        newItemTextField.delegate = self
        
    //MARK - Customize the corner radius
        
        newItemTextField.layer.cornerRadius = newItemTextField.frame.height / 2.0
        addButton.layer.cornerRadius = addButton.frame.height / 2.0
        


        
    }

    //MARK - IBActions
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let newItem = Item()
        newItem.item = newItemTextField.text!
        
        self.itemArray.append(newItem)
        
        self.itemTableView.reloadData()
        
        self.newItemTextField.text! = ""
        
        
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        itemTableView.isEditing = !itemTableView.isEditing
        
    }
    
    
    //MARK - TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].item
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    
    //Mark - Tableview Delegate Methods
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    } else {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
  
    }
    
    //MARK - moving the items
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let temp = itemArray[sourceIndexPath.row]
        itemArray.remove(at: sourceIndexPath.row)
        itemArray.insert(temp, at: sourceIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            itemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
        }
    }
}

