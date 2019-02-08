//
//  TodoListTableViewController.swift
//  MVVM_Todolist3
//
//  Created by Ice on 8/2/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    //var todoListVM: TodoListViewModel = .init(myTodolist: TodoList())
    lazy var todoListVM: TodoListViewModel = {
        let model = TodoList()
        return TodoListViewModel(myTodolist: model)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Todo List"
        
        todoListVM.dataReload = { [weak self] () in
            guard let strongSelf = self else { return }
            strongSelf.tableView.reloadData()
        }
        todoListVM.getItems()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListVM.todoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = todoListVM.todoList[indexPath.row]

        return cell
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        weak var addVC = self.storyboard?.instantiateViewController(withIdentifier: "addStory") as? AddListViewController
        self.navigationController?.pushViewController( addVC!, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        todoListVM.getItems()
    }
    
}
