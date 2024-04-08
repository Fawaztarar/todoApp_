//
//  TodoListView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 14/02/2024.
//

import Foundation

//import SwiftUI
//
//struct TodoItem: Identifiable {
//    let id = UUID()
//    var title: String
//    var isToggled: Bool = false
//    var description: String = ""
//}
//
//struct TodoListView: View {
//    @State private var todos = [
//        TodoItem(title: "Complete SwiftUI Tutorial", description: "Finish the interactive tutorials on SwiftUI."),
//        TodoItem(title: "Grocery Shopping", description: "Buy groceries for the week."),
//        TodoItem(title: "Workout", description: "Attend the gym session at 7 PM."),
//    ]
//    @State private var newTodoTitle = ""  // State to hold the title of the new ToDo
//    
//    var body: some View {
//        NavigationView {
//            
//            VStack {
//                List {
//                    // TextField to enter a new ToDo title
//                    HStack {
//                        TextField("Enter new todo", text: $newTodoTitle)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        Button(action: {
//                            guard !newTodoTitle.isEmpty else { return }
//                            let newTodo = TodoItem(title: newTodoTitle)
//                            todos.append(newTodo)  // Add the new ToDo to the list
//                            newTodoTitle = ""  // Reset the TextField
//                        }) {
//                            Image(systemName: "plus.circle.fill")
//                                .foregroundColor(.green)
//                        }
//                    }
//                    
//                    // Existing ToDos
//                    ForEach($todos) { $todo in
//                        NavigationLink(destination: TodoItemView(todo: .constant(todo))) {
//                            HStack {
//                                Text(todo.title)
//                            
//                                    
//                                Spacer()
//                                Toggle("", isOn: $todo.isToggled)
//                                    .labelsHidden() // Hide the Toggle labe
//                            }
//                        }
//                    }
//                }
//                .listStyle(PlainListStyle())
//                
//                // Button to toggle all ToDos
//                Button("Toggle All") {
//                    withAnimation {
//                        for index in todos.indices {
//                            todos[index].isToggled.toggle()
//                        }
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("Todo's")
//            
//        }
//    }
//    
//    
//    
//    struct TodoListView_Previews: PreviewProvider {
//        static var previews: some View {
//            NavigationView {
//                TodoListView()
//            }
//        }
//    }
//    
//}

//import SwiftUI
//struct TodoItem: Identifiable {
//    let id = UUID()
//    var title: String
//    var isToggled: Bool = false
//    var description: String = ""
//}
//
//struct TodoListView: View {
//    @State private var todos = [
//        TodoItem(title: "Complete SwiftUI Tutorial", description: "Finish the interactive tutorials on SwiftUI."),
//        TodoItem(title: "Grocery Shopping", description: "Buy groceries for the week."),
//        TodoItem(title: "Workout", description: "Attend the gym session at 7 PM."),
//    ]
//    @State private var newTodoTitle = ""
//
//    var body: some View {
//        // Use GeometryReader to adapt to the available space
//        GeometryReader { geometry in
//            VStack {
//                // Use ScrollView to allow for more items than fit on the screen
//                ScrollView {
//                    LazyVStack {
//                        HStack {
//                            TextField("Enter new todo", text: $newTodoTitle)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .frame(maxWidth: geometry.size.width - 60) // limit the text field width
//                            Button(action: addNewTodo) {
//                                Image(systemName: "plus.circle.fill")
//                                    .foregroundColor(.green)
//                            }
//                        }
//                        .padding()
//
//                        // Loop over todos
//                        ForEach($todos) { $todo in
//                            NavigationLink(destination: TodoItemView(todo: $todo)) {
//                                TodoRow(todo: todo)
//                            }
//                        }
//                    }
//                }
//                
//                Button("Toggle All", action: toggleAll)
//                    .padding()
//            }
//            .navigationTitle("Todos")
//            // Applying list style within NavigationView
//            .listStyle(GroupedListStyle())
//        }
//    }
//
//    private func addNewTodo() {
//        guard !newTodoTitle.isEmpty else { return }
//        let newTodo = TodoItem(title: newTodoTitle)
//        todos.append(newTodo)
//        newTodoTitle = ""
//    }
//
//    private func toggleAll() {
//        withAnimation {
//            for index in todos.indices {
//                todos[index].isToggled.toggle()
//            }
//        }
//    }
//}
//
//// Custom Todo Row View
//struct TodoRow: View {
//    var todo: TodoItem
//
//    var body: some View {
//        HStack {
//            Text(todo.title)
//            Spacer()
//            // Toggle is moved here if it needs to be shown inside the row
//            Toggle("", isOn: .constant(todo.isToggled))
//                .labelsHidden()
//        }
//    }
//}
//
//struct TodoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoListView()
//    }
//}
