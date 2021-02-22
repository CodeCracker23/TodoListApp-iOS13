//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by M. Raşit Öner on 25.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var toDoLabel: UILabel!
    var toDo: ToDoItem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if toDo != nil {
            if toDo!.important {
                if let name = toDo?.name {
                    toDoLabel.text = "❗️" + name
                }
            } else {
                toDoLabel.text = toDo?.name
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if toDo != nil {
            context.delete(toDo!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }

            }
    }

