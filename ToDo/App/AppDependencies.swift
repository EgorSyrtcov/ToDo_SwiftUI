import Foundation
import Combine

protocol AppDependencies: HasGetShoppingItemsUseCase {}

final class AppDependenciesImpl: AppDependencies {
    
    //     MARK: - Properties
    //     MARK: Public
    
    var getShoppingItemsUseCase: GetShoppingItemsUseCase {
        .init(shoppingItemsRepository: shoppingItemsRepository)
    }
    
    private var shoppingItemsRepository: ShoppingItemsRepository {
        ShoppingItemsRepositoryImpl()
    }
}

// MARK: - Preview only

final class AppDependenciesPreview: AppDependencies {
    
    let getShoppingItemsUseCase: GetShoppingItemsUseCase
    
    init() {
        let shoppingItemsRepository = ShoppingItemsRepositoryPreview()
        self.getShoppingItemsUseCase = .init(shoppingItemsRepository: shoppingItemsRepository)
    }
}

public final class ShoppingItemsRepositoryPreview: ShoppingItemsRepository {
    public init() {}
    
    public func shoppingItems() -> AnyPublisher<[TaskModel], Error> {
        Result.Publisher(.success([
            TaskModel(title: "111", description: "", isCompleted: false),
            TaskModel(title: "222", description: "nil", isCompleted: true),
            TaskModel(title: "333", description: "nil", isCompleted: false)
        ])).eraseToAnyPublisher()
    }
}
