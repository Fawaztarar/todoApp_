//
//  TodoViewMode.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 08/04/2024.
//


import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = []

    func addTask(title: String, description: String) {
        let newTodo = TodoItem(title: title, description: description)
        todos.append(newTodo)
    }

    func editTask(id: UUID, title: String, description: String) {
        // Find the task by id and update its title and description
        if let index = todos.firstIndex(where: { $0.id == id }) {
            todos[index].title = title
            todos[index].description = description
        }
    }

    func deleteTask(id: UUID) {
        // Remove the task by id
        todos.removeAll { $0.id == id }
    }
}
