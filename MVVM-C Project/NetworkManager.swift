//
//  NetworkManager.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 24.02.22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getTexts(completionHandler: @escaping (Result<[String], Error>) -> Void) {
        guard let url = Constants.textsUrl else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let texts = String(data: data, encoding: .utf8) {
                // error: <EXPR>:3:31: error: unterminated string literal texts.components(separatedBy: "\")
                //So I decide to split string with "n"
                completionHandler(.success(texts.components(separatedBy: "n")))
            } else {
                completionHandler(.failure(BasicError.unknownError))
            }
        }.resume()
    }
}
