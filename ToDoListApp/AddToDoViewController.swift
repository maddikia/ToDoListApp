//
//  AddToDoViewController.swift
//  ToDoListApp
//
//  Created by Madison Ramos on 6/14/21.
//

import UIKit

class AddToDoViewController: UIViewController {

    // this is a view controller
    // this is another sentence
    // wow many changes, time to commit
    var previousVC = ToDoTableViewController()
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            try? context.save()
        }

        // From Iteration #1
        // Question: why is this a constant? isn't it being changed in a bit?
        //let toDo = ToDo()
        
        // Optional binding—unwrapping safely
        // Maybe ask about this  in more depth?
        /*if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }*/
        
        // Add To Dos
        //previousVC.toDos.append(toDo)
        //previousVC.tableView.reloadData()
        
        // Automatically send user back to Table View after adding
        navigationController?.popViewController(animated: true)
        
    }

}
