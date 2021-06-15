//
//  HomeViewViewModel.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/14/21.
//

import Foundation

final class HomeViewViewModel: ObservableObject {
    
    // MARK: - Inner Types

    typealias Dependencies = HasGetShoppingItemsUseCase
    
    // MARK: - Properties
    // MARK: Public
    
    weak var router: HomeViewRouter?
    
    @Published var items = [TaskModel]()
    
    // MARK: Private

    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

}

extension HomeViewViewModel {
    static let _preview = HomeViewViewModel(dependencies: AppDependenciesPreview())
}
