//
//  ShopoingItemsRepository.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/15/21.
//

import Foundation
import Combine

public protocol ShoppingItemsRepository {

    func shoppingItems() -> AnyPublisher<[TaskModel], Error>
    func addShoppingItem(with title: String, description: String?) -> AnyPublisher<Void, Error>
    func deleteShoppingItem(with id: String) -> AnyPublisher<Void, Error>
    func isCompleted(with id: String) -> AnyPublisher<Void, Error>
}
