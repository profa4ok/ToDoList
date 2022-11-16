//
//  ListRowView.swift
//  ToDoList
//
//  Created by Максим Радюш on 8.11.22.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Button {
            } label: {
                Image(systemName: item.isCpompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCpompleted ? .green : .red)
            }
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First", isCpompleted: true)
    static var item2 = ItemModel(title: "Second", isCpompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
       
    }
}
