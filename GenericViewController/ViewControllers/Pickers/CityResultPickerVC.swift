//
//  CityResultPickerVC.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import UIKit

class CityResultPickerVC: ResultPickerVC<CityDataSource> {
    
    init(completionHandler: @escaping ((CityEntity) -> Void)) {
        super.init(dataSource: CityDataSource(), input: ResultRendererVC(), completionHandler: completionHandler)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
