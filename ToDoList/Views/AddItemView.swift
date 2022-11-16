//
//  AddItemView.swift
//  ToDoList
//
//  Created by Максим Радюш on 8.11.22.
//

import SwiftUI

struct AddItemView: View {
    
    @State private var isShowAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var newItem: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add new item here...", text: $newItem)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: {
                    saveButton()
                }, label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title2)
                })
            }
            .padding(15)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $isShowAlert) {
            getAlert()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if newItem.count < 3 {
            alertTitle = "Warning! Enter more 2 symbol! 😎"
            isShowAlert.toggle()
            return false
        }
        return true
    }
    
    func saveButton() {
        if textIsAppropriate() {
            listViewModel.addItem(item: newItem)
            dismiss.callAsFunction()
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddItemView()
        }
        .environmentObject(ListViewModel())
    }
}
