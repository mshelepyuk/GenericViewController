//
//  ResultRendererVC.swift
//  GenericViewController
//
//  Created by Maxim Shelepyuk on 03/03/2018.
//  Copyright © 2018 Maxim Shelepyuk. All rights reserved.
//

import UIKit

private let cellId = "TableViewCell"

class ResultRendererVC: UIViewController {
    var tableView: UITableView!
    
    var results: [CommonResultListItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var delegate: ResultRendererDelegate?
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        view.addSubview(tableView!)
    }
}

// MARK: - UITableViewDataSource
extension ResultRendererVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultItem = results[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
        cell.textLabel?.text = resultItem.title
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ResultRendererVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(at: indexPath.row)
    }
}

// MARK: - ResultRendererInput
extension ResultRendererVC: ResultRendererInput {
    func passData(_ data: [CommonResultListItem]) {
        self.results = data
    }
}
