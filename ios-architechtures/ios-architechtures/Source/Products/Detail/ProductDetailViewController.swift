//
//  ProductDetailViewController.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    let customView = ProductDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = customView
    }
    
}
