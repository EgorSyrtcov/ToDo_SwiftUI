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
        let task1 = TaskModel(title: "Купить молоко", description: "3 литра")
        let task2 = TaskModel(title: "Купить хлеб", description: "1 буханка")
        let task3 = TaskModel(title: "Купить сметана", description: "1 пачка")
        
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
}

