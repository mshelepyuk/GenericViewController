//
//  CityDataSource.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

class CityDataSource: CommonDataSource {
    weak var delegate: CommonDataSourceDelegate?
    
    lazy var results: [CityEntity] = []
    
    func set(query: String?) {
        results = CityEntity.template()
        
        delegate?.resultsFetched(results)
    }
}
