//
//  HasComletedShoppingItem.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/18/21.
//

import Foundation
import Combine

public protocol HasComletedShoppingItem {
    var comletedShoppingItemUseCase: CompletedShoppingItemUseCase { get }
}

public struct CompletedShoppingItemUseCase {
    
    // MARK: - Properties
    // MARK: Private

    private let shoppingItemsRepository: ShoppingItemsRepository

    // MARK: - Initializers

    public init(shoppingItemsRepository: ShoppingItemsRepository) {
        self.shoppingItemsRepository = shoppingItemsRepository
    }
    
    // MARK: - API

    public func run(with id: String) -> AnyPublisher<Void, Error> {
        shoppingItemsRepository.isCompleted(with: id)
    }
}
