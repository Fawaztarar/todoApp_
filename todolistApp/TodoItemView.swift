//
//  TodoItemView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 14/02/2024.
//

//import Foundation
//import SwiftUI
//
//struct TodoItemView: View {
//    @Binding var todo: TodoItem  // Use a binding to allow modifications
//
//    var body: some View {
//        ZStack {
//            // Gradient background
//            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .edgesIgnoringSafeArea(.all)
//            
//            // Use a ScrollView for long content instead of a Form
//            ScrollView {
//                VStack(spacing: 20) {
//                    Section(header: Text("To-Do Details").foregroundColor(.white)) {
//                        TextField("Title", text: $todo.title)
//                            .padding()
//                            .background(Color.white.opacity(0.7))
//                            .cornerRadius(5)
//
//                    }
//                    
//                    Section(header: Text("Description").foregroundColor(.white)) {
//                        TextEditor(text: $todo.description)
//                            .frame(height: 200)  // Set a fixed height for the TextEditor
//                            .padding()
//                            .background(Color.white.opacity(0.7))
//                            .cornerRadius(5)
//                    }
//                    
//                }
//                .padding()
//            }
//        }
//        .navigationTitle(todo.title)  // Use the todo item's title as the navigation title
//        .navigationBarTitleDisplayMode(.inline)  // Display the title inline with the navigation bar
//    }
//}
//
//struct TodoItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone 12 Pro Max", "iPad Pro (12.9-inch) (5th generation)"], id: \.self) { deviceName in
//            NavigationView {
//                TodoItemView(todo: .constant(TodoItem(title: "Sample Todo", isToggled: false)))
//            }
//            .previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//    }
//}
//}
//
//
