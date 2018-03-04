//
//  ResultPickerVC.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import UIKit

typealias RendererInputVC = UIViewController & ResultRendererInput

class ResultPickerVC<T: CommonDataSource>: UIViewController {
    var searchView: UITextField!
    var resultInput: UIViewController & ResultRendererInput
    
    var dataSource: T
    
    private var completionHandler: ((T.Entity) -> Void)
    
    init(dataSource: T, input: RendererInputVC, completionHandler: @escaping ((T.Entity) -> Void)) {
        self.dataSource = dataSource
        self.resultInput = input
        self.completionHandler = completionHandler
        
        super.init(nibName: nil, bundle: nil)
        
        resultInput.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultInput.delegate = self
        dataSource.delegate = self
        
        let searchFrame = CGRect(x: 0, y: 44.0, width: view.frame.width, height: 60.0)
        searchView = UITextField(frame: searchFrame)
        searchView.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
        view.addSubview(searchView)
        
        let resultsFrame = CGRect(x: 0, y: searchFrame.maxY, width: view.frame.width, height: view.frame.height - searchFrame.maxY)
        resultInput.view.frame = resultsFrame
        
        view.addSubview(resultInput.view)
        addChildViewController(resultInput)
    }
    
    @objc func textDidChanged(_ input: UITextField) {
        dataSource.set(query: input.text)
    }
}

// MARK: - CommonDataSourceDelegate
extension ResultPickerVC: CommonDataSourceDelegate {
    func resultsFetched(_ results: [CommonResultListItem]) {
        resultInput.passData(results)
    }
}

// MARK: - ReesultRendererDelegate {
extension ResultPickerVC: ResultRendererDelegate {
    func didSelect(at index: Int) {
        let resultItem = dataSource.result(at: index)
        
        completionHandler(resultItem)
    }
}
