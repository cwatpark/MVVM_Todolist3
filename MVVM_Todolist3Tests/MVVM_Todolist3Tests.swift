//
//  MVVM_Todolist3Tests.swift
//  MVVM_Todolist3Tests
//
//  Created by Ice on 8/2/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import XCTest
@testable import MVVM_Todolist3
import Firebase

class MVVM_Todolist3Tests: XCTestCase {

    class TodoListFake: ListItemsType {
        var names = ["678", "456", "123"]
        func getItems(onSuccess itemArray: @escaping ([String]) -> Void) {
            itemArray(names)
        }
        
        var temp = ""
        func addItems(item: String) {
            temp = item
        }
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTodoListViewModel(){
        let todoList = TodoListFake()
        let todoListVM = TodoListViewModel(myTodolist: todoList)
        
        var call = false
        todoListVM.dataReload = { () in
            call = true
        }
        
        todoListVM.getItems()
        
        //What is it that we want to test ?
        XCTAssertTrue(call)
        XCTAssertEqual(todoListVM.todoList, todoList.names)

    }
    
    func testAddListViewModel(){
        let todoList = TodoListFake()
        let addListVM = AddListViewModel(myAdd: todoList)
        
        var itemFake = "Joker"
        addListVM.addItems(item: itemFake)
        
        XCTAssertEqual(itemFake, itemFake)
        
    }
}
