//
//  StreetDataSource.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

class StreetDataSource: CommonDataSource {
    weak var delegate: CommonDataSourceDelegate?
    
    lazy var results: [StreetEntity] = []
    
    func set(query: String?) {
        results = StreetEntity.template()
        
        delegate?.resultsFetched(results)
    }
}
