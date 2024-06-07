//
//  ProductService.swift
//  ios-architechtures
//
//  Created by Guilherme Gatto on 06/06/24.
//

import UIKit

class ProductService {
    
    static let service = ProductService()

    
    private init() {
        
    }

    private func request(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) {(data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
                    
            guard let data = data else {
                completion(.failure(NSError(domain: "no data", code: -1)))
                return
            }
            
            completion(.success(data))
            
        }.resume()
    }
    
    
    func getAllProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        let baseUrl = URL(string: "https://fakestoreapi.com/products/")!
        request(url: baseUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([ProductModel].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getProductBy(id: Int, completion: @escaping (Result<ProductModel, Error>) -> Void) {
        let baseUrl = URL(string: "https://fakestoreapi.com/products/\(id)")!
        request(url: baseUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(ProductModel.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
