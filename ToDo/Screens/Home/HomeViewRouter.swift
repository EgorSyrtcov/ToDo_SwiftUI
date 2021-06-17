//
//  HomeViewRouter.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/14/21.
//

import SwiftUI

protocol HomeViewRouter: Router {
    func goToAddItem(_ completion: (() -> Void)?)
    func goToItemDetails(_ item: TaskModel)
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
    
    func goToAddItem(_ completion: (() -> Void)?) {
        let router = AddItemRouterImpl(dependencies: dependencies, completion: completion)
        let navigationController = UINavigationController(rootViewController: router)
        present(navigationController)
    }
    
    func goToItemDetails(_ item: TaskModel) {
        let router = TaskDetailsRouterImp(dependencies: dependencies, task: item)
        push(router)
    }
}

struct y: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
