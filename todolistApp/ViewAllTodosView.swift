//
//  ViewAllTodosView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 08/04/2024.
//

import Foundation
import SwiftUI

struct ViewAllTodosView: View {
    @ObservedObject var viewModel: TodoViewModel
    
    var body: some View {
        List {
            ForEach($viewModel.todos) { $todo in
                HStack {
                    if todo.isCompleted {
                        Text("✓").foregroundColor(.green)
                    }
                    Text(todo.title)
                        .strikethrough(todo.isCompleted, color: .gray)
                    
                    Spacer()
                    
                    Button(action: {
                        todo.isCompleted.toggle()
                    }) {
                        Image(systemName: todo.isCompleted ? "circle" : "checkmark.circle.fill")
                            .foregroundColor(todo.isCompleted ? .gray : .green)
                    }
                    
                    Button("Edit") {
                        // Implement edit functionality
                    }
                    .padding(.leading, 10)
                    
                    Button("Delete") {
                        viewModel.deleteTask(id: todo.id)
                    }
                    .padding(.leading, 10)
                }
            }
        }
        .navigationTitle("Todos")
    }
}
