//
//  AddPageViewController.swift
//  ToDo List
//
//  Created by M. Raşit Öner on 25.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            //bos bir ToDoItem context(coreDta) icinde yaratilir
             let newToDo = ToDoItem(context: context)
                    if let name = nameTextField.text {
                        //yaratilan ietmin ici doldurulur
                        newToDo.name = name
                        newToDo.important = importantSwitch.isOn
                        importantSwitch.setOn(true, animated: true)
                        //degisiklikler kaydedilir
                        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                        navigationController?.popViewController(animated: true)
        }
       

        }
    }
    


 

 

}
