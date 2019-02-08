//
//  TodoList.swift
//  MVVM_Todolist3
//
//  Created by Ice on 8/2/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import Foundation
import Firebase

protocol ListItemsType {
    func getItems(onSuccess itemArray: @escaping (_ items: [String] ) -> Void)
    func addItems(item:String)
}

class TodoList: ListItemsType {

    
    lazy var db: Database = {
       return Database.database()
    }()
  
    func getItems(onSuccess itemArray: @escaping (_ items: [String] ) -> Void) {
        //self.dataBaseReference = Database.database().reference()
        db.reference().child("Items").observeSingleEvent(of: .value) { (itemSnap) in
            var itemList: [String] = []
            
            for child in itemSnap.children {
                let snapshot = child as? DataSnapshot
                let value = snapshot?.value
                itemList.append("\((value ?? ""))")
            }
            itemArray(itemList)
        }
    }
    
    func addItems(item: String) {
        //self.dataBaseReference = Database.database().reference()
        db.reference().child("Items").childByAutoId().setValue(item)
    }
}

