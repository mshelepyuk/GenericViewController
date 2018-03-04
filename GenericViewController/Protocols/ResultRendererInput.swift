//
//  ResultRendererInput.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import Foundation

protocol ResultRendererInput {
    weak var delegate: ResultRendererDelegate? { get set }
    
    func passData(_ data: [CommonResultListItem])
}
