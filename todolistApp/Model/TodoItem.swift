//
//  TodoItem.swift
//  todolistApp
//
//  Created by Fawaz Tarar on 08/04/2024.
//

import Foundation


struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var description: String = ""
    var isCompleted: Bool = false  // Tracks the completion status of the todo item
}
