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
    
    public func deleteShoppingItem(with id: String) -> AnyPublisher<Void, Error> {
        shoppingItems()
            .flatMap { items -> AnyPublisher<Void, Error> in
                let items = items.filter { $0.id != id }
                let data = (try? JSONEncoder().encode(items)) ?? Data()
                UserDefaults.standard.set(data, forKey: Constants.itemsKey)
                return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
            }.eraseToAnyPublisher()
    }
    
    public func isCompleted(with id: String) -> AnyPublisher<Void, Error> {
        shoppingItems()
            .flatMap { items -> AnyPublisher<Void, Error> in
                
                //items.first(where: {$0.id == id })? .toggleCompleted()
                
                guard let item = items.first(where: {$0.id == id }),
                      let index = items.firstIndex(of: item)
                      else { return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()}
                
                let newItem = TaskModel(id: item.id,
                                        title: item.title,
                                        description: item.description,
                                        isCompleted: !item.isCompleted)
                var newItems = items
                newItems.remove(at: index)
                newItems.insert(newItem, at: max(index - 1,0))
                
                let data = (try? JSONEncoder().encode(newItems)) ?? Data()
                UserDefaults.standard.set(data, forKey: Constants.itemsKey)
                return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
            }.eraseToAnyPublisher()
    }
}

public final class ShoppingItemsRepositoryPreview: ShoppingItemsRepository {
    
    public init() {}
    
    public func shoppingItems() -> AnyPublisher<[TaskModel], Error> {
        Result.Publisher(.success([])).eraseToAnyPublisher()
    }
    
    public func addShoppingItem(with title: String, description: String?) -> AnyPublisher<Void, Error> {
        Result.Publisher(.success(())).eraseToAnyPublisher()
    }
    
    public func deleteShoppingItem(with id: String) -> AnyPublisher<Void, Error> {
        Result.Publisher(.success(())).eraseToAnyPublisher()
    }
    
    public func isCompleted(with id: String) -> AnyPublisher<Void, Error> {
        Result.Publisher(.success(())).eraseToAnyPublisher()
    }
}
