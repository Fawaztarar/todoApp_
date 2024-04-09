//
//  ViewAllTodosView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 08/04/2024.
//

import SwiftUI

struct ViewAllTodosView: View {
    @ObservedObject var viewModel: TodoViewModel
    @State private var showingAddNewTask = false
    @State private var isEditing = false
    @State private var selectedTaskId: UUID?

    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.todos) { $todo in
                    HStack {
                        if todo.isCompleted {
                            Text("✓").foregroundColor(.green)
                        }
                        Text(todo.title)
                            .strikethrough(todo.isCompleted, color: .gray)
                            .onTapGesture {
                                // Optional: Define an action for tapping on the task text
                                // e.g., todo.isCompleted.toggle()
                            }

                        Spacer()

                        Button(action: {
                            todo.isCompleted.toggle()
                        }) {
                            Image(systemName: todo.isCompleted ? "circle" : "checkmark.circle.fill")
                                .foregroundColor(todo.isCompleted ? .gray : .green)
                        }
                        .buttonStyle(PlainButtonStyle()) // Ensures the button doesn't style the text

                        Button("Edit") {
                            selectedTaskId = todo.id
                            isEditing = true
                        }
                        .padding(.leading, 10)

                        Button("Delete") {
                            viewModel.deleteTask(id: todo.id)
                        }
                        .padding(.leading, 10)
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddNewTask = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddNewTask) {
                AddNewTaskView(viewModel: viewModel)
            }
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        withAnimation {
            viewModel.todos.remove(atOffsets: offsets)
        }
    }
}




// Preview provider for ViewAllTodosView
struct ViewAllTodosView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllTodosView(viewModel: TodoViewModel())
    }
}
