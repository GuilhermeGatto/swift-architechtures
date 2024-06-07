//
//  ProductListViewModel.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 07/06/24.
//

import UIKit

protocol ProductListViewModelDelegate: AnyObject {
    func updateProducts(with list: [ProductModel])
    func showLoading()
    func removeLoading()
}

final class ProductListViewModel {
 
    // MARK: - Auxiliar Vairable
    private var productList = [ProductModel]()
    
    weak var delegate: ProductListViewModelDelegate?
    
    // MARK: - Init Variables
    private let service: ProductService
    
    init(service: ProductService = ProductService.service) {
        self.service = service
    }
    
    // MARK: - Public functions
    func requestAllProducts() {
        delegate?.showLoading()
        service.getAllProducts { result in
            switch result {
            case .success(let productList):
                self.productList = productList
                self.delegate?.updateProducts(with: self.productList)
            case .failure(let error):
                break
            }
            self.delegate?.removeLoading()
        }
    }
    
    func filter(for text: String) {
        if text.isEmpty {
            delegate?.updateProducts(with: productList)
            return
        }
        
        let filteredList = productList.filter { $0.title.contains(text) }
        delegate?.updateProducts(with: filteredList)
    }
    
}
