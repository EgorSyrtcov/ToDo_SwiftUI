//
//  AddTaskRouter.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/15/21.
//

import SwiftUI

protocol AddTaskRouter: Router {}

final class AddItemRouterImpl: BaseRouter<AddTaskView>, AddTaskRouter {

    // MARK: - Properties
    // MARK: Private

    private let completion: (() -> Void)?

    // MARK: - Initialiers

    init(dependencies: AppDependencies, completion: (() -> Void)? = nil) {
        self.completion = completion
        let model = AddTaskViewModel(dependencies: dependencies)
        let view = AddTaskView(viewModel: model)
        super.init(view: view)
        model.router = self
    }

    deinit {
        completion?()
    }
}

