//
//  ViewController.swift
//  ToDoList
//
//  Created by Page Kallop on 12/16/20.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "HI"
        itemArray.append(newItem)
        
    }
    
//MARK - UITableVIew Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
    
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        // allows users to check and uncheck items in row
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
           cell.accessoryType = .none
        }
        
        return cell
    }
//MARK- Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        //local texfield variable 
        var textField = UITextField()
        
        // creats alert and allows users to add new item to list
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            // appends new item the the itemArray
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.tableView.reloadData()
            
        }
        // creates textfield
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

}

