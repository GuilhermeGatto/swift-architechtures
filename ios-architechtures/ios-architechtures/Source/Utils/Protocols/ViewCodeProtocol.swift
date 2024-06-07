//
//  ViewCodeProtocol.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import Foundation

protocol ViewCodeProtocol {
    func setupViewCode()
    func setupSubViews()
    func setupConstraints()
}

extension ViewCodeProtocol {
    func setupViewCode() {
        setupSubViews()
        setupConstraints()
    }
}
