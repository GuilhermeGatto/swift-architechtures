//
//  ProductListViewController.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class ProductListViewController: UIViewController {
    
    private var productList =  [ProductModel]()
    private var isFiltering = false
    private var filteredProductList =  [ProductModel]()
    
    private lazy var customView: ProductListView = {
        let view = ProductListView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
        configureSearch()
    }
    
    override func loadView() {
        self.view = customView
    }
    
    private func configureSearch() {
        customView.search.addTarget(self, action: #selector(search), for: .editingChanged)
    }
    
    
    @objc func search() {
        isFiltering = true
        let text = customView.search.text ?? ""
        
        if text.isEmpty {
            isFiltering = false
        } else {
            filteredProductList = productList.filter { $0.title.contains(text) }
        }
        
        customView.tableView.reloadData()
    }
    
    private func getProducts() {
        ProductService.service.getAllProducts { result in
            switch result {
            case .success(let products):
                self.productList = products
                DispatchQueue.main.async {
                    self.customView.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}


extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredProductList.count : productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell",
                                                       for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        
        let list = isFiltering ? filteredProductList : productList
        
        cell.configure(with: list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = isFiltering ? filteredProductList : productList
        navigationController?.pushViewController(ProductDetailViewController(id: list[indexPath.row].id),
                                                 animated: true)
    }

}
