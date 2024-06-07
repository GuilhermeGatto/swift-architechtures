//
//  ProductListViewController.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class ProductListViewController: UIViewController {
    
    private lazy var customView: ProductListView = {
        let view = ProductListView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = customView
    }
    
}


extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell",
                                                       for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ProductDetailViewController(), animated: true)
    }

}
