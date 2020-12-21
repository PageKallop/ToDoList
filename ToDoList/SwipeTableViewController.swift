//
//  SwipeTableViewController.swift
//  ToDoList
//
//  Created by Page Kallop on 12/18/20.
//

import UIKit
import SwipeCellKit
import CoreData

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate{
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = 80.0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        
        cell.delegate = self
        
        
        return cell
    }
   
    
    //delete cell function
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == . right else { return nil }
        //swipe delete action
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            
           self.updateModel(at: indexPath)
            

            print("item deleted")
        }
        deleteAction.image = UIImage(named: "delete-Icon")
        

        return [deleteAction]
        

    }

    func updateModel(at indexPath: IndexPath) {
       

    }
    
}


