//
//  TextsViewController.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import UIKit

protocol TextsViewInterface: AnyObject {
    func reloadData()
}

class TextsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    deinit {
        print("Deinit: TextsViewController")
    }
    
    var viewModel: TextsViewModelInterface!
    
    static func instatiate() -> TextsViewController {
        let storyBoard = UIStoryboard(name: "Texts", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "TextsViewController") as? TextsViewController ?? .init()
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadTexts()
        setupTableView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: String(describing: TextsScreenTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TextsScreenTableViewCell.self))
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TextsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextsScreenTableViewCell.self)) as? TextsScreenTableViewCell
        let item = viewModel.items[indexPath.row]
        cell?.fill(item)
        return cell ?? UITableViewCell()
    }
}

extension TextsViewController: TextsViewInterface {
    func reloadData() {
        self.tableView.reloadData()
    }
}
