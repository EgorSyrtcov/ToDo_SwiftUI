//
//  TaskModel.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/3/21.
//

import UIKit

class TaskModel {
    
    let title: String
    let description: String?
    let iconImageName = "circle"
    let isCompleted: Bool = false
    
    init(title: String, description: String?) {
        self.title = title
        self.description = description
    }
}
