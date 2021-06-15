//
//  HasGetShoppingItemsUseCase.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/15/21.
//

import Foundation
import Combine

public protocol HasGetShoppingItemsUseCase {
    var getShoppingItemsUseCase: GetShoppingItemsUseCase { get }
}

public struct GetShoppingItemsUseCase {

    // MARK: - Properties
    // MARK: Private

    private let shoppingItemsRepository: ShoppingItemsRepository

    // MARK: - Initializers

    public init(shoppingItemsRepository: ShoppingItemsRepository) {
        self.shoppingItemsRepository = shoppingItemsRepository
    }

    // MARK: - API

    public func run() -> AnyPublisher<[TaskModel], Error> {
        shoppingItemsRepository.shoppingItems()
    }
}

