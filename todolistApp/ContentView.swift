//
//  ContentView.swift
//  todolistApp


//
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel = TodoViewModel()
//
//    var body: some View {
//        GeometryReader { geometry in
//            NavigationView {
//                ZStack {
//                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                        .edgesIgnoringSafeArea(.all)
//
//                    VStack {
//                        Spacer()
//
//                        Text("Task's Manager")
//                            .font(.system(size: 40, weight: .bold, design: .rounded))
//                            .foregroundColor(.white)
//                            .shadow(radius: 5)
//
//                        Image(systemName: "checkmark.seal.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: geometry.size.width * 0.3)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .bottom)))
//                            .shadow(radius: 10)
//
//                        Spacer()
//
//                        // Button to add a new task
//                        NavigationLink(destination: AddNewTaskView(viewModel: viewModel)) {
//                            Text("Add New Task")
//                                .fontWeight(.bold)
//                                .foregroundColor(.blue)
//                                .padding()
//                                .frame(maxWidth: .infinity)
//                                .background(Color.white)
//                                .cornerRadius(10)
//                                .shadow(radius: 5)
//                                .padding(.horizontal, geometry.size.width * 0.1)
//                        }
//
//                        // Button to view all tasks
//                        NavigationLink(destination: ViewAllTodosView(viewModel: viewModel)) {
//                            Text("View All Tasks")
//                                .fontWeight(.bold)
//                                .foregroundColor(.blue)
//                                .padding()
//                                .frame(maxWidth: .infinity)
//                                .background(Color.white)
//                                .cornerRadius(10)
//                                .shadow(radius: 5)
//                                .padding(.horizontal, geometry.size.width * 0.1).padding(.top, 20) // Add spacing between buttons
//                        }
//
//                        Spacer()
//                    }
//                }
//            }
//            .navigationViewStyle(StackNavigationViewStyle()) // This ensures the navigation view is full screen on iPad
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var showingAddNewTask = false
    @State private var navigateToViewAllTodos = false  // State to control navigation to ViewAllTodosView

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()

                    Text("Task's Manager")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(radius: 5)

                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .bottom)))
                        .shadow(radius: 10)

                    Spacer()

                    Button("Add New Task") {
                        showingAddNewTask = true
                    }
                    .buttonStyle(MainButtonStyle())

                    Button("View All Tasks") {
                        navigateToViewAllTodos = true
                    }
                    .buttonStyle(MainButtonStyle())

                    Spacer()
                }
            }
            .sheet(isPresented: $showingAddNewTask) {
                AddNewTaskView(viewModel: viewModel, navigateToViewAllTodos: $navigateToViewAllTodos)
            }
            .fullScreenCover(isPresented: $navigateToViewAllTodos) {
                ViewAllTodosView(viewModel: viewModel)
            }
        }
    }
}

// Define the button style once, to reuse for multiple buttons
struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.horizontal, 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
