//
//  PreviewProvider.swift
//  ToDo
//
//  Created by Egor Syrtcov on 6/3/21.
//

import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPriview {
        return DeveloperPriview.shared
    }
}

class DeveloperPriview {
    
    static let shared = DeveloperPriview()
    private init() {}
    
    let mockTask = TaskModel(title: "Купить молоко", description: "2 литра")
}
