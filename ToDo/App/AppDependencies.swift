import Foundation
import Combine

protocol AppDependencies: HasGetShoppingItemsUseCase, HasAddShoppingItemUseCase, HasDeleteShoppingItemUseCase {}

final class AppDependenciesImpl: AppDependencies {
    
    //     MARK: - Properties
    //     MARK: Public
    
    var getShoppingItemsUseCase: GetShoppingItemsUseCase {
        .init(shoppingItemsRepository: shoppingItemsRepository)
    }
    
    var addShoppingItemUseCase: AddShoppingItemUseCase {
        .init(shoppingItemsRepository: shoppingItemsRepository)
    }
    
    var deleteShoppingItemUseCase: DeleteShoppingItemUseCase {
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
    let deleteShoppingItemUseCase: DeleteShoppingItemUseCase
    
    init() {
        let shoppingItemsRepository = ShoppingItemsRepositoryPreview()
        self.getShoppingItemsUseCase = .init(shoppingItemsRepository: shoppingItemsRepository)
        self.addShoppingItemUseCase = .init(shoppingItemsRepository: shoppingItemsRepository)
        self.deleteShoppingItemUseCase = .init(shoppingItemsRepository: shoppingItemsRepository)
    }
}
