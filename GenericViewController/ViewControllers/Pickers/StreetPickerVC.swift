//
//  StreetPickerVC.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import UIKit

class StreetResultPickerVC: ResultPickerVC<StreetDataSource> {
    
    init(completionHandler: @escaping ((StreetEntity) -> Void)) {
        super.init(dataSource: StreetDataSource(), input: ResultRendererVC(), completionHandler: completionHandler)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
