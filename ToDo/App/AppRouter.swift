import UIKit

final class AppRouter {

    // MARK: - Properties
    // MARK: Private

    private let window: UIWindow

    // MARK: - Initializers

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - API

    func start(with dependencies: AppDependencies) {
        let router = HomeViewRouterImpl(dependencies: dependencies)
        let navigationController = UINavigationController(rootViewController: router)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}
