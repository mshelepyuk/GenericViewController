//
//  HousePickerVC.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

class HouseResultPickerVC: ResultPickerVC<HouseDataSource> {
    
    init(completionHandler: @escaping ((HouseEntity) -> Void)) {
        super.init(dataSource: HouseDataSource(), completionHandler: completionHandler)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
