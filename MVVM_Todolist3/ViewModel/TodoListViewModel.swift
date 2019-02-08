//
//  TodoListViewModel.swift
//  MVVM_Todolist3
//
//  Created by Ice on 8/2/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import Foundation
class TodoListViewModel {
    
    private let myTodoList: ListItemsType
    var todoList: [String] = []
    var dataReload: (() -> Void)?
    
    init(myTodolist: ListItemsType) {
        self.myTodoList = myTodolist
    }
    
    func getItems() {
        myTodoList.getItems { [weak self] (item) in
            guard let strongSelf = self else { return }
            var newItem = item
    
            strongSelf.todoList = newItem
            strongSelf.dataReload?()
        }
    }
    
}
