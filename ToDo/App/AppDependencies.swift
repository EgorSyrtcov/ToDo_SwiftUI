import Foundation
import Combine

protocol AppDependencies: HasGetShoppingItemsUseCase, HasAddShoppingItemUseCase {}

final class AppDependenciesImpl: AppDependencies {
    
    //     MARK: - Properties
    //     MARK: Public
    
    var getShoppingItemsUseCase: GetShoppingItemsUseCase {
        .init(shoppingItemsRepository: shoppingItemsRepository)
    }
    
    var addShoppingItemUseCase: AddShoppingItemUseCase {
        .init(shoppingItemsRepository: shoppingItemsRepository)
    }
    
    private var shoppingItemsRepository: ShoppingItemsRepository {
        ShoppingItemsRepositoryImpl()
    }
}

// MARK: - Preview only

final class AppDependenciesPreview: AppDependencies {
    
    let getShoppingItemsUseCase: GetShoppingItemsUseCase
    let addShoppingItemUseCase: AddShoppingItemUseCase
    
    init() {
        let shoppingItemsRepository = ShoppingItemsRepositoryPreview()
        self.getShoppingItemsUseCase = .init(shoppingItemsRepository: shoppingItemsRepository)
        self.addShoppingItemUseCase = .init(shoppingItemsRepository: shoppingItemsRepository)
    }
}
