//
//  HomeViewModel.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/3/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var taskLists = [TaskModel]()
    
    init() {
        getMockTasks()
    }
    
    func getMockTasks() {
        let task1 = TaskModel(title: "Купить молоко", description: "3 литра", isCompleted: true)
        let task2 = TaskModel(title: "Купить хлеб", description: "1 буханка", isCompleted: false)
        let task3 = TaskModel(title: "Купить сметана", description: "1 пачка", isCompleted: false)
        
        taskLists.append(task1)
        taskLists.append(task2)
        taskLists.append(task3)
    }
    
    func deleteTask(index: IndexSet) {
        taskLists.remove(atOffsets: index)
    }
    
    func addToDo(_ task: TaskModel) {
        taskLists.append(task)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        taskLists.move(fromOffsets: from, toOffset: to)
    }
    
    func updateTask(task: TaskModel) {
        
        if let index = taskLists.firstIndex ( where: { $0.id == task.id }) {
            taskLists[index] = TaskModel(title: task.title, description: task.description, isCompleted: !task.isCompleted)
        }
    }
    
}

