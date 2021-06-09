//
//  TaskModel.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/3/21.
//

import UIKit

struct TaskModel: Identifiable, Codable {
    
    let id: String
    let title: String
    let description: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, description: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
    }
}
