//
//  AddNewTaskView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 08/04/2024.
//

//import Foundation
//import SwiftUI
//
//struct AddNewTaskView: View {
//    @ObservedObject var viewModel: TodoViewModel  // Reference to the ViewModel
//    @State private var taskTitle: String = ""
//    @State private var taskDescription: String = ""
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            TextField("Task Title", text: $taskTitle)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            TextEditor(text: $taskDescription)
//                .frame(height: 200)
//                .border(Color.gray, width: 1)
//                .padding()
//
//            HStack {
//                Button("Save") {
//                    viewModel.addTask(title: taskTitle, description: taskDescription)
//                    // Logic to dismiss the view or clear the fields after saving
//                }
//                .buttonStyle(FilledButtonStyle())
//
////                Button("Edit") {
////                    print("Edit functionality goes here")
////                }
////                .buttonStyle(FilledButtonStyle())
//
//                Button("Delete") {
//                    print("Delete functionality goes here")
//                }
//                .buttonStyle(FilledButtonStyle())
//            }
//            .padding()
//        }
//        .navigationTitle("Add New Task")
//    }
//}
//
//struct FilledButtonStyle: ButtonStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//    }
//}
//
//// Preview provider for AddNewTaskView
//struct AddNewTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Create an instance of TodoViewModel for the preview
//        let viewModel = TodoViewModel()
//
//        // Return the AddNewTaskView, passing the viewModel to it
//        AddNewTaskView(viewModel: viewModel)
//            .previewLayout(.sizeThatFits) // Layout option to fit the content size
//    }
//}


import SwiftUI

struct AddNewTaskView: View {
    @ObservedObject var viewModel: TodoViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var navigateToViewAllTodos: Bool  // Binding to trigger navigation in the parent view
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Task Title", text: $taskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextEditor(text: $taskDescription)
                    .frame(height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    .padding()

                HStack {
                    Button("Save") {
                        viewModel.addTask(title: taskTitle, description: taskDescription)
                        navigateToViewAllTodos = true  // Set the state to trigger navigation in the parent view
                        presentationMode.wrappedValue.dismiss()  // Dismiss the current view
                    }
                    .buttonStyle(FilledButtonStyle())

                    Button("Home") {
                        presentationMode.wrappedValue.dismiss()  // Simply dismiss the view to go "Home"
                    }
                    .buttonStyle(FilledButtonStyle())
                }
                .padding()
            }
            .navigationTitle("Add New Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

// Preview provider for AddNewTaskView
struct AddNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView(viewModel: TodoViewModel(), navigateToViewAllTodos: .constant(false))
    }
}
