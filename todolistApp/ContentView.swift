//  contentView.swift

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var showingAddNewTask = false
    @State private var navigateToViewAllTodos = false  // This will trigger the fullScreenCover

    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)

                // Main content
                VStack {
                    Spacer()

                    // Title
                    Text("Tasks Manager")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(radius: 5)

                    // Icon
                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .bottom)))
                        .shadow(radius: 10)

                    Spacer()

                    // Add New Task button
                    Button("Add New Task") {
                        showingAddNewTask = true
                    }
                    .buttonStyle(MainButtonStyle())

                    // View All Tasks button
                    Button("View All Tasks") {
                        navigateToViewAllTodos = true
                    }
                    .buttonStyle(MainButtonStyle())

                    Spacer()
                }
            }
            .sheet(isPresented: $showingAddNewTask) {
                // AddNewTaskView with a closure to handle navigation to ViewAllTodosView
                AddNewTaskView(viewModel: viewModel) {
                    // This closure will be called after a new task is added
                    navigateToViewAllTodos = true
                    showingAddNewTask = false
                }
            }
            .fullScreenCover(isPresented: $navigateToViewAllTodos) {
                // ViewAllTodosView presented as a full screen cover
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
