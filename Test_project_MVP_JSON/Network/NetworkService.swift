//
//  NetworkService.swift
//  Test_project_MVP_JSON
//
//  Created by Алексей Авдейчик on 11.10.21.
//

import Foundation

protocol NetworkServiceProtocol {
    func getCommentsAndImages(completion: @escaping(Result<[ImageAndComments], Error>) -> Void)
}
class NetworkService: NetworkServiceProtocol {
    func getCommentsAndImages(completion: @escaping (Result<[ImageAndComments], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([ImageAndComments].self, from: data!)
                completion(.success(obj))
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
