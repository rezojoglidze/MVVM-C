//
//  Constants.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 25.02.22.
//

import Foundation

struct Constants {
    
    static func getTextsUrl() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.random.org"
        components.path = "/strings/"
        components.queryItems = [
            URLQueryItem(name: "num", value: "10"),
            URLQueryItem(name: "len", value: "8"),
            URLQueryItem(name: "digits", value: "on"),
            URLQueryItem(name: "upperalpha", value: "on"),
            URLQueryItem(name: "loweralpha", value: "on"),
            URLQueryItem(name: "unique", value: "on"),
            URLQueryItem(name: "format", value: "plain"),
            URLQueryItem(name: "rnd", value: "new")
        ]
        return URL(string: components.string ?? "")
    }
  
}
