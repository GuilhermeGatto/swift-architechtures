//
//  ProductListView.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class ProductListView: UIView {
    
    var title: UILabel = {
        let label = UILabel()
        label.text = "Products"
        label.font = .systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        setupViewCode()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProductListView: ViewCodeProtocol {
    func setupSubViews() {
        addSubview(title)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            title.heightAnchor.constraint(equalToConstant: 50),
            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }

}
