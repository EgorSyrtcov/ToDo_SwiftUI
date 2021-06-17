//
//  AddTaskViewModel.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/15/21.
//

import Foundation
import Combine

final class AddTaskViewModel: ObservableObject {
    
    // MARK: - Inner Types

    typealias Dependencies = HasAddShoppingItemUseCase
    
    // MARK: - Properties
    // MARK: Public

    weak var router: AddTaskRouter?

    // MARK: Private
    
    private let dependencies: Dependencies
    private var addItemCancellable: AnyCancellable?
    
    // MARK: - Initializers
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func cancelAction() {
        router?.close()
    }
    
    func createItemAction(title: String, description: String?) {
        addItemCancellable = dependencies.addShoppingItemUseCase.run(with: title, description: description)
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .failure:
                    break
                case .finished:
                    self?.router?.close()
                }
            }, receiveValue: {})
    }
}

extension AddTaskViewModel {
    static let _preview = AddTaskViewModel(dependencies: AppDependenciesPreview())
}

extension AddTaskViewModel {
    
    func textIsAppropriate(textCount: Int) -> Bool {
        if textCount < 3 {
            return false
        }
        return true
    }
}
