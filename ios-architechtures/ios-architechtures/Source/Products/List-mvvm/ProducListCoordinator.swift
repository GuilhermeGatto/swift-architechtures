//
//  ProducListCoordinator.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 26/06/24.
//

import UIKit

protocol ProducListCoordinatorDelegate: AnyObject {
    func goToDetail(for id: Int)
}

final class ProducListCoordinator {
    
    let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let service = ProductService.service
        let viewModel = ProductListViewModel(service: service)
        let controller = ProductListViewController(viewModel: viewModel)
        controller.router = self
        navigation.pushViewController(controller, animated: true)
    }
}

extension ProducListCoordinator: ProducListCoordinatorDelegate {
    func goToDetail(for id: Int) {
        let detailController = ProductDetailViewController(id: id)
        navigation.pushViewController(detailController, animated: true)
    }
}
