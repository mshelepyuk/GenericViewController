//
//  CommonDataSource.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

// MARK: - DataSourceDelegate
protocol CommonDataSourceDelegate: class {
    func resultsFetched(_ results: [CommonResultListItem])
}

// MARK: - DataSource
protocol CommonDataSource {
    associatedtype Entity: CommonResultListItem
    
    weak var delegate: CommonDataSourceDelegate? { get set }
    var results: [Entity] { get set }
    
    func set(query: String?)
}

extension CommonDataSource {
    var resultsCount: Int {
        return results.count
    }
    
    func result(at index: Int) -> Entity {
        return results[index]
    }
}
