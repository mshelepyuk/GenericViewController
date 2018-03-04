//
//  HouseEntity.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

struct HouseEntity {
    let id: Int
    let number: String
}

extension HouseEntity {
    
    static func template() -> [HouseEntity] {
        var results: [HouseEntity] = []
        
        for i in 0...10 {
            let house = HouseEntity(id: i, number: "#\(i) House")
            results.append(house)
        }
        
        return results
    }
}
