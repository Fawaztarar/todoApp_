//
//  TodoItemView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 14/02/2024.
//

import Foundation

import SwiftUI

struct TodoItemView: View {
    @Binding var todo: TodoItem  // Use a binding to allow modifications

    var body: some View {
        Form {
            Section(header: Text("Details")) {
                TextField("Title", text: $todo.title)
                Toggle(isOn: $todo.isToggled) {
                    Text("Completed")
                }
            }
            
            Section(header: Text("Description")) {
                TextEditor(text: $todo.description)
                    .frame(height: 200)  // Set a fixed height for the TextEditor
            }
        }
        .navigationTitle(todo.title)  // Use the todo item's title as the navigation title
        .navigationBarTitleDisplayMode(.inline)  // Display the title inline with the navigation bar
    }
}


struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(todo: .constant(TodoItem(title: "Sample Todo", isToggled: false)))
    }
}

