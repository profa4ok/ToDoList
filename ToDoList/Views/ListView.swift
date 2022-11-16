//
//  ListView.swift
//  ToDoList
//
//  Created by Максим Радюш on 8.11.22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NotItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .navigationTitle("ToDo List ✏️")
        .listStyle(PlainListStyle())
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                EditButton()
                    .fontWeight(.semibold)
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddItemView()
                } label: {
                    Text("Add")
                        .fontWeight(.semibold)
                }

            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

