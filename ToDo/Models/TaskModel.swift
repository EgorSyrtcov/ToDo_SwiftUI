//
//  TaskModel.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/3/21.
//

import UIKit

struct TaskModel: Identifiable {
    
    let id: String = UUID().uuidString
    let title: String
    let description: String?
    let iconImageName = "circle"
    let isCompleted: Bool = false
}
