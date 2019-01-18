//
//  ViewController.swift
//  Moody
//
//  Created by James Chen on 1/12/19.
//  Copyright © 2019 James Chen. All rights reserved.
//

import UIKit

class MoodViewController: UITableViewController {

    var itemArray = ["Jan 1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoodItemCell",
            for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    // TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath) {
        //print(itemArray[indexPath.row])
        
        // = is assignment; == is used for checking
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .disclosureIndicator
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Add new entry to journal (Moody)
    @IBAction func composeButtonPressed(_ sender: UIBarButtonItem) {
        
        // create local variable within this sope
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Entry", message: "", preferredStyle: .alert )
        
        let action = UIAlertAction(title: "Add Entry", style: .default) { (action) in
            // What happens when user adds a new entry to their journal
            // should also have a mood selector on entry
            
            self.itemArray.append(textField.text!)
            
        }
        
        alert.addTextField { (alertTextField) in
            // some grayed out text to let users know what to do
            alertTextField.placeholder = "Record a mood"
            textField = alertTextField
            
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

