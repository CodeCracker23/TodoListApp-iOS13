//
//  ToDoTableTableViewController.swift
//  ToDo List
//
//  Created by M. Raşit Öner on 24.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    
    
    var toDos : [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataToDoItems = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem]{
                toDos = coreDataToDoItems
                tableView.reloadData()
            }
    }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        
        let cell = UITableViewCell()
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            if let name = toDo.name {
                cell.textLabel?.text = "❗️" + name

            }
        } else {
            cell.textLabel?.text = toDo.name
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        
        if let completeVC = segue.destination as? CompleteViewController {
            if let toDo = sender as? ToDoItem {
                completeVC.toDo = toDo
            }
            
        }
        
      
    }
    
    
}

