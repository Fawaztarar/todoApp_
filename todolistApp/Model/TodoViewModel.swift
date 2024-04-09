//
//  TodoViewModel.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 08/04/2024.
//

import Foundation

struct TodoItem: Identifiable, Codable {  // Ensure TodoItem conforms to Codable
    var id = UUID()
    var title: String
    var description: String = ""
    var isCompleted: Bool = false
}

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = []

    init() {
        loadTasks()
    }

    func addTask(title: String, description: String) {
        let newTodo = TodoItem(title: title, description: description)
        todos.append(newTodo)
        saveTasks()
    }
    
    func editTask(id: UUID, title: String, description: String) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
        todos[index].title = title
        todos[index].description = description
        // Note: Do not save tasks here
    }
    
    func deleteTask(id: UUID) {
        todos.removeAll { $0.id == id }
        saveTasks()
    }
    
    func toggleTaskCompleted(id: UUID) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
        todos[index].isCompleted.toggle()
        saveTasks()
    }
    
    // Save tasks to UserDefaults
    private func saveTasks() {
        do {
            let encodedTasks = try JSONEncoder().encode(todos)
            UserDefaults.standard.set(encodedTasks, forKey: "todos")
        } catch {
            print("Failed to encode tasks: \(error)")
        }
    }
    
    // Load tasks from UserDefaults
    private func loadTasks() {
        if let savedTasks = UserDefaults.standard.data(forKey: "todos"),
           let decodedTasks = try? JSONDecoder().decode([TodoItem].self, from: savedTasks) {
            todos = decodedTasks
        }
    }
}
