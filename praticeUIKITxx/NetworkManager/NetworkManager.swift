//
//  NetworkManager.swift
//  praticeUIKITxx
//
//  Created by duc on 2021-10-20.
//


import Foundation

enum CountryError: Error {
    case noDataAvailable, canNotProcessData
}

enum Result<T, Error> {
    case success(T)
    case failure(Error)
}

class NetworkManager {
    let session: URLSession
    private let resourceURL: URL
    private let url = "https://restcountries.com/v2/all"
    
    init(session: URLSession = .shared) {
        guard let resourceURL = URL(string: url) else { fatalError() }
        
        self.resourceURL = resourceURL
        self.session = session
    }
    
    func getCountries(completion: @escaping(Result<[WorldData], CountryError>) -> Void) {
        let dataTask = session.dataTask(with: resourceURL) { (data, _, error) in
            
            guard let jsonData = data else {
                return completion(.failure(.noDataAvailable))
            }
            
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let results = try decoder.decode([WorldData].self, from: jsonData)
                    completion(.success(results))
                } catch let jsonError {
                    print(jsonError)
                    completion(.failure(.canNotProcessData))
                }
            }
        }
        dataTask.resume()
    }
}
