//
//  CityEntity.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

struct CityEntity {
    let id: Int
    let title: String
}

extension CityEntity {
    
    static func template() -> [CityEntity] {
        var results: [CityEntity] = []
        
        for i in 0...10 {
            let city = CityEntity(id: i, title: "#\(i) City")
            results.append(city)
        }
        
        return results
    }
}
