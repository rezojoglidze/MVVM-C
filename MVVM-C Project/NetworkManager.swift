//
//  NetworkManager.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import Foundation

class NetworkManager {
    let textsUrl = URL(string: "https://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new")
  
    

    func getTexts(completionHandler: @escaping (Result<[String], Error>) -> Void) {
        guard let url = textsUrl else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let texts = try JSONDecoder().decode([String].self, from: data)
                    completionHandler(.success(texts))
                } catch let error {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}
