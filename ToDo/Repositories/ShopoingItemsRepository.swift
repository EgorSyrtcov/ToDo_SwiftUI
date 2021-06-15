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
}
