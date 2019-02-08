//
//  AddListViewModel.swift
//  MVVM_Todolist3
//
//  Created by Ice on 8/2/2562 BE.
//  Copyright © 2562 Ice. All rights reserved.
//

import Foundation
class AddListViewModel {
    
    private let myAdd: ListItemsType
    
    init(myAdd: ListItemsType) {
        self.myAdd = myAdd
    }
    
    func addItems(item: String) {
        myAdd.addItems(item: item)
    }
}
