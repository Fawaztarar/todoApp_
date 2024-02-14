//
//  TodoListView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 14/02/2024.
//

import Foundation

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isToggled: Bool = false
    var description: String = ""
}

struct TodoListView: View {
    @State private var todos = [
        TodoItem(title: "Complete SwiftUI Tutorial", description: "Finish the interactive tutorials on SwiftUI."),
        TodoItem(title: "Grocery Shopping", description: "Buy groceries for the week."),
        TodoItem(title: "Workout", description: "Attend the gym session at 7 PM."),
    ]
    @State private var newTodoTitle = ""  // State to hold the title of the new ToDo

    var body: some View {
        VStack {
            List {
                // TextField to enter a new ToDo title
                HStack {
                    TextField("Enter new todo", text: $newTodoTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        guard !newTodoTitle.isEmpty else { return }
                        let newTodo = TodoItem(title: newTodoTitle)
                        todos.append(newTodo)  // Add the new ToDo to the list
                        newTodoTitle = ""  // Reset the TextField
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                    }
                }

                // Existing ToDos
                ForEach($todos) { $todo in
                    NavigationLink(destination: Text("Detail view for \($todo.title.wrappedValue)")) {
                        HStack {
                            Text(todo.title)
                                .onTapGesture {
                                        print("Todo item tapped: \(todo.title)")
                                    }
                            Spacer()
                            Toggle("", isOn: $todo.isToggled)
                                                                .labelsHidden() // Hide the Toggle labe
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())

            // Button to toggle all ToDos
            Button("Toggle All") {
                withAnimation {
                    for index in todos.indices {
                        todos[index].isToggled.toggle()
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Todos")
    }
}



struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoListView()
        }
    }
}

