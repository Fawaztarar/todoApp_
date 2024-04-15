//
//  AddNewTaskViewTests.swift
//  todolistAppTests
//
//  Created by Fawaz Tarar on 09/04/2024.
//

import Foundation
import XCTest
@testable import todolistApp // Import your app module
import SwiftUI

class AddNewTaskViewTests: XCTestCase {
    
    func testSaveButtonAddsTask() {
        // Arrange
        let viewModel = TodoViewModel()
        // Assuming the ViewModel starts with pre-populated tasks
        let initialCount = viewModel.todos.count
        let expectedTaskTitle = "Test Task"
        let expectedTaskDescription = "This is a test task."
        
        // Act
        viewModel.addTask(title: expectedTaskTitle, description: expectedTaskDescription)
        
        // Assert
        XCTAssertEqual(viewModel.todos.count, initialCount + 1, "There should be one more task in the list.")
        XCTAssertEqual(viewModel.todos.last?.title, expectedTaskTitle, "Task title should match.")
        XCTAssertEqual(viewModel.todos.last?.description, expectedTaskDescription, "Task description should match.")
    }

    
}
