//
//  ItemModel.swift
//  ToDoList
//
//  Created by Максим Радюш on 8.11.22.
//

import Foundation

//Imutable Struct

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCpompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCpompleted: Bool) {
        self.id = id
        self.title = title
        self.isCpompleted = isCpompleted
    }
    
    func updateComplection() -> ItemModel {
        return ItemModel(id: id, title: title, isCpompleted: !isCpompleted)
    }
}
