//
//  HomeViewModel.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/3/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var taskLists = [TaskModel]() {
        didSet {
            saveTasks()
        }
    }
    private let itemsKey = "task_lisk"
    
    init() {
        getMockTasks()
    }
    
    func getMockTasks() {
//        let task1 = TaskModel(title: "Купить молоко", description: "3 литра", isCompleted: true)
//        let task2 = TaskModel(title: "Купить хлеб", description: "1 буханка", isCompleted: false)
//        let task3 = TaskModel(title: "Купить сметана", description: "1 пачка", isCompleted: false)
//
//        taskLists.append(task1)
//        taskLists.append(task2)
//        taskLists.append(task3)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data)
            else { return }
        self.taskLists = savedTasks
    }
    
    func deleteTask(index: IndexSet) {
        taskLists.remove(atOffsets: index)
    }
    
    func addToDo(_ task: TaskModel) {
        taskLists.append(task)
    }
    
    func updateTask(task: TaskModel) {
        
        if let index = taskLists.firstIndex ( where: { $0.id == task.id }) {
            taskLists[index] = TaskModel(title: task.title, description: task.description, isCompleted: !task.isCompleted)
        }
    }
    
    func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(taskLists) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
}

