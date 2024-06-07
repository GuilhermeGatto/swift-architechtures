//
//  ProductDetailView.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class ProductDetailView: UIView {
    let container: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let image: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var name: UILabel = {
        let label = UILabel()
        label.text = "p1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var price: UILabel = {
        let label = UILabel()
        label.text = "R$ 12,90"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var desc: UILabel = {
        let label = UILabel()
        label.text = "bla bla bla bla bla bla bla"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

extension ProductDetailView: ViewCodeProtocol {
    func setupSubViews() {
        addSubview(container)
        container.addArrangedSubview(image)
        container.addArrangedSubview(name)
        container.addArrangedSubview(desc)
        container.addArrangedSubview(price)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 300)

        ])
    }

}
