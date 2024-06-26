//
//  ProductListViewController.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class ProductListViewController: UIViewController {
    // MARK: - Custom View
    private lazy var customView: ProductListView = {
        let view = ProductListView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.delegate = self
        view.tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        return view
    }()

    // MARK: - Controller Properties
    private var list =  [ProductModel]()
    var router: ProducListCoordinatorDelegate?
    
    // MARK: - Initializer
    let viewModel: ProductListViewModel
    
    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.requestAllProducts()
    }
    
    override func loadView() {
        self.view = customView
    }
}

// MARK: - UITableViewDelegate / UITableViewDataSource
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell",
                                                       for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.goToDetail(for: list[indexPath.row].id)
    }

}

// MARK: - ProductListViewModelDelegate
extension ProductListViewController: ProductListViewModelDelegate {
    func updateProducts(with list: [ProductModel]) {
        self.list = list
        DispatchQueue.main.async {
            self.customView.tableView.reloadData()
        }
    }
    
    func showLoading() {
        // show loading
    }
    
    func removeLoading() {
        // remove loading
    }
}


// MARK: - ProductListViewDelegate
extension ProductListViewController: ProductListViewDelegate {
    func didEditSearch(with text: String) {
        viewModel.filter(for: text)
    }
    
}
