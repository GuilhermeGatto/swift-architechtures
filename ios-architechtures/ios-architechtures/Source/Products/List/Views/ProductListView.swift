//
//  ProductListView.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class ProductListView: UIView {
    
    var search: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "buscar"
        textfield.font = .systemFont(ofSize: 15)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 8
        textfield.leftView = UIView(frame: .init(x: 0, y: 0, width: 8, height: 0))
        textfield.leftViewMode = .always
        textfield.clipsToBounds = true
        return textfield
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
        addSubview(search)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            search.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            search.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            search.heightAnchor.constraint(equalToConstant: 50),
            tableView.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }

}
