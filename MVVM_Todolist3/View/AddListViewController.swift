//
//  AddListViewController.swift
//  MVVM_Todolist3
//
//  Created by Ice on 8/2/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {
    
    lazy var addVM: AddListViewModel = {
        let model = TodoList()
        return AddListViewModel(myAdd: model)
    }()
    
    @IBOutlet weak var itemField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Items"
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        addVM.addItems(item: itemField.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("Leave from Add ViewController")
    }
    
}
