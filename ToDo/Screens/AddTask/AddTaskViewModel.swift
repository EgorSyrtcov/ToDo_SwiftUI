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
    
}

extension AddTaskViewModel {
    static let _preview = AddTaskViewModel(dependencies: AppDependenciesPreview())
}
