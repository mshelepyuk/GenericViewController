//
//  ResultPickerVC.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import UIKit

class ResultPickerVC<T: CommonDataSource>: UIViewController {
    typealias ResultPickerCompletion = ((T.Entity) -> Void)
    
    var searchView: UITextField!
    
    private var suggestVC: SuggestResultVC<T, ResultPickerVC>
    
    private var completionHandler: ResultPickerCompletion
    
    init(dataSource: T, completionHandler: @escaping ResultPickerCompletion) {
        self.suggestVC = SuggestResultVC(dataSource: dataSource)
        self.completionHandler = completionHandler
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suggestVC.delegate = self
        
        let searchFrame = CGRect(x: 0, y: 44.0, width: view.frame.width, height: 60.0)
        searchView = UITextField(frame: searchFrame)
        searchView.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
        view.addSubview(searchView)
        
        let resultsFrame = CGRect(x: 0, y: searchFrame.maxY, width: view.frame.width, height: view.frame.height - searchFrame.maxY)
        suggestVC.view.frame = resultsFrame
        
        view.addSubview(suggestVC.view)
        addChildViewController(suggestVC)
    }
    
    @objc func textDidChanged(_ input: UITextField) {
        suggestVC.set(query: input.text)
    }
}

// MARK: - GenericResultDelegate
extension ResultPickerVC: SuggestResultsDelegate {
    func didSelect(result: T.Entity) {
        completionHandler(result)
    }
}
