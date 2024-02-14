//
//  TodoItemView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 14/02/2024.
//

import Foundation

import SwiftUI



struct TodoItemView: View {
    @Binding var todo: TodoItem

    var body: some View {
        VStack {
            TextField("Edit todo title", text: $todo.title)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Toggle("Completed", isOn: $todo.isToggled)
                .padding()
            TextField("Description", text: $todo.description)  // TextField for editing the description
                            .frame(height: 200)
        }
        .navigationTitle("Todo Details")
    }
}





struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(todo: .constant(TodoItem(title: "Sample Todo", isToggled: false)))
    }
}

