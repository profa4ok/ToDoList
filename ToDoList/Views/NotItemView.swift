//
//  NotItemView.swift
//  ToDoList
//
//  Created by Максим Радюш on 16.11.22.
//

import SwiftUI

struct NotItemView: View {
    
    @State private var isAnimate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your ToDo List!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddItemView()) {
                    Text("Add new item  🥳")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(isAnimate ? Color.red : Color.blue)
                        .cornerRadius(10)
                        .font(.headline)
                }
                .padding(.horizontal, isAnimate ? 30 : 50)
                .scaleEffect(isAnimate ? 1.0 : 1.0)
                .offset(y: isAnimate ? -7 : 0)
                .shadow(color: isAnimate ? Color.red.opacity(0.7) : Color.blue.opacity(0.7),
                        radius: isAnimate ? 30 : 30,
                        x: 0,
                        y: isAnimate ? 50 : 30)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !isAnimate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeIn(duration: 2.0)
                    .repeatForever()
            ) {
                isAnimate.toggle()
            }
        }
    }
    
}

struct NotItemView_Previews: PreviewProvider {
    static var previews: some View {
        NotItemView()
    }
}
