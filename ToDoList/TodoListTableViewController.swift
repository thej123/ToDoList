//
//  ViewController.swift
//  ToDoList
//
//  Created by Thej on 9/13/17.
//  Copyright © 2017 Thej. All rights reserved.
//

import UIKit
import CoreData

class ToDoListTableViewController: UITableViewController, TodoListDelegate {
    
    let MOC = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [ToDoListItems]()
    

    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "TodoListSegue", sender: sender)
    }
    
    func addItem(by controller: InputViewController, title: String, notes: String, date: String) {
        print(title, notes, date)
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "ToDoListItems", into: MOC) as! ToDoListItems
        item.title = title
        item.describe = notes
        item.date = date
        items.append(item)
        
        do {
            try MOC.save()
        } catch {
            print ("\(error)")
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    func fetchAllData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoListItems")
        do {
            let result = try MOC.fetch(request)
            items = result as! [ToDoListItems]
        } catch {
            print ("\(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDoListSegue", sender: indexPath)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let endPoint = segue.destination as! InputViewController
        endPoint.delegate = self
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            let item = items[indexPath.row]
            item.checkmark = false
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            let item = items[indexPath.row]
            item.checkmark = true
        }
        
        do {
            try MOC.save()
        } catch {
            print("\(error)")
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCustomCell") as! TodoCustomCell
        cell.titleLabel?.text = items[indexPath.row].title
        cell.notesLabel?.text = items[indexPath.row].describe
        cell.dateLabel?.text = items[indexPath.row].date
        if items[indexPath.row].checkmark == true {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

