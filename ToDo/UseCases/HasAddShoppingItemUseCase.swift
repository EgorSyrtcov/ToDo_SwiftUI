//
//  HasAddShoppingItemUseCase.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/15/21.
//

import Foundation
import Combine

public protocol HasAddShoppingItemUseCase {
    var addShoppingItemUseCase: AddShoppingItemUseCase { get }
}

public struct AddShoppingItemUseCase {

    // MARK: - Properties
    // MARK: Private

    private let shoppingItemsRepository: ShoppingItemsRepository

    // MARK: - Initializers

    public init(shoppingItemsRepository: ShoppingItemsRepository) {
        self.shoppingItemsRepository = shoppingItemsRepository
    }

    // MARK: - API

    public func run(with title: String, description: String?) -> AnyPublisher<Void, Error> {
        shoppingItemsRepository.addShoppingItem(with: title, description: description)
    }

}
