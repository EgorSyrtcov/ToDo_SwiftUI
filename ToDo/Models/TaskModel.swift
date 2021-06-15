//
//  TaskModel.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/3/21.
//

import UIKit

public struct TaskModel: Identifiable, Codable, Hashable {
    
    public let id: String
    public let title: String
    public let description: String
    public let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, description: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
    }
}

public extension TaskModel {
    static let _preview = TaskModel(title: "Title", description: "Description", isCompleted: false)
}
