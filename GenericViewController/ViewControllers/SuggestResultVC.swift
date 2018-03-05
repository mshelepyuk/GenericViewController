//
//  SuggestResultVC.swift
//  GenericViewController
//
//  Created by Shelepyuk Maksim Viktorovich on 05/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import UIKit

class SuggestResultVC<T: CommonDataSource, D: SuggestResultsDelegate>: UIViewController, UITableViewDataSource, UITableViewDelegate where T.Entity == D.Entity {
    private var dataSource: T
    weak var delegate: D?
    
    private var tableView: UITableView?
    
    init(dataSource: T) {
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.delegate = self
        
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        view.addSubview(tableView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(query: String?) {
        dataSource.set(query: query)
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.resultsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultItem = dataSource.result(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
        cell.textLabel?.text = resultItem.title
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultItem = dataSource.result(at: indexPath.row)
        
        delegate?.didSelect(result: resultItem)
    }
}

extension SuggestResultVC: CommonDataSourceDelegate {
    func resultsFetched(_ results: [CommonResultListItem]) {
        tableView?.reloadData()
    }
}
