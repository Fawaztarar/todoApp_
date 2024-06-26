
//  AddNewTaskView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 08/04/2024.
//




import SwiftUI

struct AddNewTaskView: View {
    @ObservedObject var viewModel: TodoViewModel
    @Environment(\.presentationMode) var presentationMode
    var onAddTask: (() -> Void)? // Optional closure to execute after a task is added
    @State var taskTitle: String = ""
    @State var taskDescription: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Task Title", text: $taskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextEditor(text: $taskDescription)
                    .frame(height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding()

                Button("Save") {
                    viewModel.addTask(title: taskTitle, description: taskDescription)
                    onAddTask?()
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(FilledButtonStyle())

                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(FilledButtonStyle())
            }
            .padding()
            .navigationTitle("Add New Task")
        }
    }
}

struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct AddNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView(viewModel: TodoViewModel())
    }
}
