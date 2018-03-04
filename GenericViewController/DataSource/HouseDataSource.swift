//
//  HouseDataSource.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

class HouseDataSource: CommonDataSource {
    weak var delegate: CommonDataSourceDelegate?
    
    lazy var results: [HouseEntity] = []
    
    func set(query: String?) {
        results = HouseEntity.template()
        
        delegate?.resultsFetched(results)
    }
}
