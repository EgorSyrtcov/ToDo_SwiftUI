//
//  HasDeleteShoppingItemUseCase.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/17/21.
//

import Foundation
import Combine

public protocol HasDeleteShoppingItemUseCase {
    var deleteShoppingItemUseCase: DeleteShoppingItemUseCase { get }
}

public struct DeleteShoppingItemUseCase {

    // MARK: - Properties
    // MARK: Private

    private let shoppingItemsRepository: ShoppingItemsRepository

    // MARK: - Initializers

    public init(shoppingItemsRepository: ShoppingItemsRepository) {
        self.shoppingItemsRepository = shoppingItemsRepository
    }

    // MARK: - API

    public func run(with id: String) -> AnyPublisher<Void, Error> {
        shoppingItemsRepository.deleteShoppingItem(with: id)
    }

}

