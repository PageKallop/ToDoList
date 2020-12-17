//
//  CategoryTableViewController.swift
//  ToDoList
//
//  Created by Page Kallop on 12/17/20.
//

import UIKit
import Foundation
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
         loadCategory()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }


    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        
        //local texfield variable
        var textField = UITextField()
        
        // creats alert and allows users to add new item to list
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            // creates a new item in core data
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            // adds new item to the array
            self.categories.append(newCategory)
           
            self.saveCategory()
            
        }
        // creates textfield
        alert.addTextField { (field) in
            textField.placeholder = "Create New Item"
            textField = field
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func saveCategory() {
        
        do {
           try context.save()
        } catch {
            print("Error saving category \(error)")
        }
        
        self.tableView.reloadData()
        
    }
                                                        
    func loadCategory() {
        
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
        categories = try context.fetch(request)
        } catch {
            print("Error loading categories \(error)")
        }
        
        tableView.reloadData()
    }

}
    

