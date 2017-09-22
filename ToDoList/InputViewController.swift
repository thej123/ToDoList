//
//  InputViewController.swift
//  ToDoList
//
//  Created by Thej on 9/18/17.
//  Copyright © 2017 Thej. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    weak var delegate: TodoListDelegate?
    
    
    
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var notesField: UITextView!
    @IBOutlet weak var dateField: UIDatePicker!
    
    @IBAction func AddItemButton(_ sender: UIButton) {
        
        let myDate = dateField.date
        print(myDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: myDate)
        print(dateString)
        
        delegate?.addItem(by: self, title: titleField.text!, notes: notesField.text!, date: dateString)
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
