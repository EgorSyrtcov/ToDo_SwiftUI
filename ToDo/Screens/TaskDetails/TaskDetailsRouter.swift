//
//  TaskDetailsRouter.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/17/21.
//

import Foundation


protocol TaskDetailsRouter: Router {}

final class TaskDetailsRouterImp: BaseRouter<TaskDetailsView>, TaskDetailsRouter {
    
    init(dependencies: AppDependencies, task: TaskModel) {
        let model = TaskDetailViewModel(dependencies: dependencies, task: task)
        let view = TaskDetailsView(viewModel: model) 
        super.init(view: view)
        model.router = self
    }
}
