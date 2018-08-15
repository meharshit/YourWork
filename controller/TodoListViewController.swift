//
//  ViewController.swift
//  YourWork
//
//  Created by Harshit Satyaseel on 15/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    var myItems = ["Home","Shopping","Study","Health","Entertainment","Extra"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        cell.textLabel?.text = myItems[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  print(myItems[indexPath.row])
        // code for the checkmark
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
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
           
            self.myItems.append(myTextFiled.text!)
            
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

