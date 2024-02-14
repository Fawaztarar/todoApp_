//
//  ContentView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 14/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showTodos = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Text("ToDo Explorer")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .bottom)))
                        .shadow(radius: 10)
                    
                    Spacer()
                    
                    Button(action: {
                        showTodos.toggle()
                    }) {
                        Text("View My Tasks")
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(.horizontal, 50)
                    }
                    .sheet(isPresented: $showTodos) {
                        TodoListView()
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

