//
//  ProductListView.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

protocol ProductListViewDelegate: AnyObject {
    func didEditSearch(with text: String)
}

class ProductListView: UIView {
    // MARK: Components Properties
    
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
    
    // MARK: - Init Varibles
    weak var delegate: ProductListViewDelegate?
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViewCode()
        addSearchListener()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handle textfield search for edit
    
    private func addSearchListener() {
        search.addTarget(self, action: #selector(editSearch), for: .editingChanged)
    }
    
    @objc private func editSearch() {
        delegate?.didEditSearch(with: search.text ?? "")
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
