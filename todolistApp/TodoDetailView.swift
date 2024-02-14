//
//  TodoDetailView.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 14/02/2024.
//

import Foundation
import SwiftUI

struct TodoDetailView: View {
    @Binding var todo: TodoItem  // Use a binding to allow modifications

    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            Toggle("Completed", isOn: $todo.isToggled)
            TextField("Description", text: $todo.description)  // TextField for editing the description
                .frame(height: 200)  // Optional: Adjust the frame for more text
        }
        .navigationTitle("Todo Details")
    }
}
