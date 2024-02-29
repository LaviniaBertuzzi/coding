//
//  TableViewController.swift
//  Coding
//
//  Created by Lavinia Bertuzzi on 29/02/24.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - ViewModel
    
    lazy var viewModel = ViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
    }
    
    // MARK: - Actions
    
    @IBAction func addFruitAction(_ sender: UIButton) {
        viewModel.counter += 1
        tableView.reloadData()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private methods
    
    func tableViewSetup() {
        tableView.dataSource = self
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.counter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel.items[safe: indexPath.row] else {
            return UITableViewCell()
        }
        return tableView.dequeueReusableCell(for: FruitTableViewCell.self, for: indexPath).configure(with: item)
    }
}
