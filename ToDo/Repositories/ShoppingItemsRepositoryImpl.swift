//
//  ShoppingItemsRepositoryImpl.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/15/21.
//

import Foundation
import Combine

public final class ShoppingItemsRepositoryImpl: ShoppingItemsRepository {

    // MARK: - Inner Types

    private enum Constants {
        static let itemsKey = "key.shoppingItems"
    }

    // MARK: - Initializers

    public init() {}

    // MARK: - ShoppingItemsRepository

    public func shoppingItems() -> AnyPublisher<[TaskModel], Error> {
        Deferred {
            Future { future in
                let data = UserDefaults.standard.data(forKey: Constants.itemsKey) ?? Data()
                var items = (try? JSONDecoder().decode([TaskModel].self, from: data)) ?? []
                items.sort(by: {
                    $0.title < $1.title
                })
                future(.success(items))
            }
        }.eraseToAnyPublisher()
    }
}
