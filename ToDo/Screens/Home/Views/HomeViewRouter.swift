//
//  HomeViewRouter.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/14/21.
//

import SwiftUI

protocol HomeViewRouter: Router {
    
}

final class HomeViewRouterImpl: BaseRouter<HomeView>, HomeViewRouter {
    
    // MARK: - Properties
    // MARK: Private

    private let dependencies: AppDependencies

    // MARK: - Initializers
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
        let model = HomeViewViewModel(dependencies: dependencies)
        let view = HomeView(viewModel: model)
        super.init(view: view)
        model.router = self
    }
}
