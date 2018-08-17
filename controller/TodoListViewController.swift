//
//  ViewController.swift
//  YourWork
//
//  Created by Harshit Satyaseel on 15/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    var myItems = [Items]()
    
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newItem = Items()
        newItem.title = "Shopping"
        myItems.append(newItem)
        
        let newItem2 = Items()
        newItem2.title = "Shopping"
        myItems.append(newItem2)
        
        let newItem3 = Items()
        newItem3.title = "Shopping"
        myItems.append(newItem3)
        
        let newItem4 = Items()
        newItem4.title = "Shopping"
        myItems.append(newItem4)
        
       if let items = defaults.array(forKey: "ToDoListArray") as? [Items]{ // type casted to the array if strings
            myItems = items

        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) // this actually reuses the cell and ones its disappers for lage data then it reassign it self as we saw the reassignmnet of check mark in our app.
        let values = myItems[indexPath.row]
        cell.textLabel?.text = values.title
        
        //Ternary operator==>
        // value = condition ? Valuetrue : valuefalse
        
        cell.accessoryType = values.done ? .checkmark : .none // just one line for the if else statements
        
//        if values.done == true{
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  print(myItems[indexPath.row])
        myItems[indexPath.row].done = !myItems[indexPath.row].done // this line actually replaced my whole if else statements.
        
//        if myItems[indexPath.row].done == false{
//            myItems[indexPath.row].done = true
//        }else{
//            myItems[indexPath.row].done = false
//        }
        
        tableView.reloadData()
        // code for the deselct.
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
        @IBAction func AddItem(_ sender: Any) {
            
            
        var myTextFiled = UITextField()
        
        let alert = UIAlertController.init(title: "Add New Work", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // things that happen ones the user clicks the button i.e the Add item button
           // print("Succedd")
           // print(myTextFiled.text as Any)
            
            let insertingValue = Items()
            insertingValue.title = myTextFiled.text!
            self.myItems.append(insertingValue)
            self.defaults.set(self.myItems, forKey: "ToDoListArray")
          //  self.defaults.synchronize()
            self.tableView.reloadData()
           
        }
        // adding a text filed in the alertview.
        alert.addTextField { (alertTextFiled) in
            alertTextFiled.placeholder = "Create new Item as Menu"
            //print(alertTextFiled.text)
            myTextFiled = alertTextFiled
        }
        // add the alertaction
        alert.addAction(action)
        // present the alertview
        present(alert, animated: true, completion: nil)
        
    }


}
