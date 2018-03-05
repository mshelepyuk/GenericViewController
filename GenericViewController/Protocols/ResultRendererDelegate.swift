//
//  ResultRendererVCDelegate.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

protocol SuggestResultsDelegate: class {
    associatedtype Entity: CommonResultListItem
    
    func didSelect(result: Entity)
}
