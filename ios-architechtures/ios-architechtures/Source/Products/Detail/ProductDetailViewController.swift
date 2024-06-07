//
//  ProductDetailViewController.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    let customView = ProductDetailView()

    private let id: Int
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductDetail()
    }
    
    override func loadView() {
        view = customView
    }
    
    private func getProductDetail() {
        ProductService.service.getProductBy(id: id) { result in
            switch result {
            case .success(let product):
                DispatchQueue.main.async {
                    self.customView.configure(with: product)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
