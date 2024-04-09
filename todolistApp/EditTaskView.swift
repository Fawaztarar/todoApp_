//
//  EditTaskView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 09/04/2024.
//
import SwiftUI

struct EditTaskView: View {
    @ObservedObject var viewModel: TodoViewModel
    @Environment(\.presentationMode) var presentationMode
    var taskIndex: Int  // Index of the task being edited
    @State private var taskTitle: String
    @State private var taskDescription: String

    init(viewModel: TodoViewModel, taskIndex: Int) {
        self.viewModel = viewModel
        self.taskIndex = taskIndex
        _taskTitle = State(initialValue: viewModel.todos[taskIndex].title)
        _taskDescription = State(initialValue: viewModel.todos[taskIndex].description)
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $taskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextEditor(text: $taskDescription)
                    .frame(height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    .padding()

                Button("Save") {
                    viewModel.editTask(id: viewModel.todos[taskIndex].id, title: taskTitle, description: taskDescription)
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(FilledButtonStyle())
                .padding()
                NavigationLink(destination: ContentView()) {
                                   Text("Cancel")
                               }
                               .buttonStyle(FilledButtonStyle())
                               .padding()
            }
            .navigationTitle("Edit Task")
        }
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TodoViewModel()
        viewModel.addTask(title: "Task Title", description: "Task Description")
        return EditTaskView(viewModel: viewModel, taskIndex: 0)
    }
}
