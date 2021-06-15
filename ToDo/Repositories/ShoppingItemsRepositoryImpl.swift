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
    
    public func addShoppingItem(with title: String, description: String?) -> AnyPublisher<Void, Error> {
        shoppingItems()
            .flatMap { items -> AnyPublisher<Void, Error> in
                let item = TaskModel(title: title, description: description ?? "", isCompleted: false)
                let items = items + [item]
                let data = (try? JSONEncoder().encode(items)) ?? Data()
                UserDefaults.standard.set(data, forKey: Constants.itemsKey)
                return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
            }.eraseToAnyPublisher()
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
    
    public func addShoppingItem(with title: String, description: String?) -> AnyPublisher<Void, Error> {
        Result.Publisher(.success(())).eraseToAnyPublisher()
    }
}
