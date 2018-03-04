//
//  Entities+ResultListItem.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

// MARK: - City
extension CityEntity: CommonResultListItem {}

// MARK: - Street
extension StreetEntity: CommonResultListItem {}

// MARK: - House
extension HouseEntity: CommonResultListItem {
    var title: String {
        return number
    }
}
