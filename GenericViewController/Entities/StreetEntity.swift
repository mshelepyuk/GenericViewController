//
//  StreetEntity.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

struct StreetEntity {
    let id: Int
    let title: String
}

extension StreetEntity {
    
    static func template() -> [StreetEntity] {
        var results: [StreetEntity] = []
        
        for i in 0...10 {
            let street = StreetEntity(id: i, title: "#\(i) Street")
            results.append(street)
        }
        
        return results
    }
}
