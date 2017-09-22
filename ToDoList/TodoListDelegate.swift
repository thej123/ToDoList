//
//  TodoListDelegate.swift
//  ToDoList
//
//  Created by Thej on 9/21/17.
//  Copyright © 2017 Thej. All rights reserved.
//

import Foundation
import UIKit

protocol TodoListDelegate: class {
    func addItem (by controller: InputViewController, title: String, notes: String, date: String)
    
}
