//
//  TaskDetailViewModel.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/17/21.
//

import Foundation
import Combine

final class TaskDetailViewModel: ObservableObject {
    
    // MARK: - Inner Types
    typealias Dependencies = HasDeleteShoppingItemUseCase & HasComletedShoppingItem
    
    // MARK: - Properties
    // MARK: Public
    
    weak var router: TaskDetailsRouter?
    
    let task: TaskModel
    
    // MARK: Private

    private var deleteCancellable: AnyCancellable?
    private var completed: AnyCancellable?
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies, task: TaskModel) {
        self.dependencies = dependencies
        self.task = task
    }
    
    func itemDeleteAction() {
        deleteCancellable = router?.goToAlert(title: "DELETE", message: "Are you sure you want to delete '\(task.title)'?")
            .filter { $0 }
            .setFailureType(to: Error.self)
            .flatMap { [weak self, dependencies, task] _ -> AnyPublisher<Void, Error> in
                dependencies.deleteShoppingItemUseCase.run(with: task.id) 
                    .handleEvents(receiveCompletion: { finished in
                        switch finished {
                        case .failure:
                            break
                        case .finished:
                            self?.router?.close()
                        }
                    })
                    .eraseToAnyPublisher()
            }.sink(receiveCompletion: { _ in }, receiveValue: {})
    }
    
    func itemCompleted() {
        completed = router?.goToAlert(title: "Completed", message: "Are you sure you want to change ?")
            .filter { $0 }
            .setFailureType(to: Error.self)
            .flatMap { [weak self, dependencies, task] _ -> AnyPublisher<Void, Error> in
                
                dependencies.comletedShoppingItemUseCase.run(with: task.id)
                    .handleEvents(receiveCompletion: { finished in
                        switch finished {
                        case .failure:
                            break
                        case .finished:
                            self?.router?.close()
                        }
                    })
                    .eraseToAnyPublisher()
            }.sink(receiveCompletion: { _ in }, receiveValue: {})
    }
}

extension TaskDetailViewModel {
    static let _preview = TaskDetailViewModel(dependencies: AppDependenciesPreview(), task: ._preview)
}
