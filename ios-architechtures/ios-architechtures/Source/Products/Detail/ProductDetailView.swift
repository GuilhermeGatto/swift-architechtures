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
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var desc: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.tintColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var price: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 50, weight: .black)
        label.tintColor = .green
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
    
    func configure(with product: ProductModel) {
        name.text = product.title
        price.text = "R$ \(product.price)"
        desc.text = product.description
        ImageDownloader.download(from: URL(string: product.image)!) { image in
            DispatchQueue.main.async {
                self.image.image = image
            }
            
        }
    }

}

extension ProductDetailView: ViewCodeProtocol {
    func setupSubViews() {
        addSubview(image)
        addSubview(name)
        addSubview(desc)
        addSubview(price)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 300),
            
            name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            desc.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
            desc.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            desc.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        
            price.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 24),
            price.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}
