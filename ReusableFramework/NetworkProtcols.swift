//
//  NetworkProtcols.swift
//  ReusableFramework
//
//  Created by JEEVAN TIWARI on 05/01/19.
//  Copyright © 2019 Book My Saloon. All rights reserved.
//

import Foundation


public enum RequestType: String {
    case GET, POST
}


public protocol APIRequest {
    var method: RequestType { get }
    var path: String { get }
    var parameters: Data { get }
    var headers: [String: String] {get}
}

extension APIRequest {
    public  func request(with baseURL: URL) -> URLRequest {
                guard let components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
                    fatalError("Unable to create URL components")
                }
     
//            components.queryItems =    parameters.map {
//                    URLQueryItem(name: String($0), value: String($1))
//                }
        
                guard let url = components.url else {
                    fatalError("Could not get url")
                }
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = parameters
        request.allHTTPHeaderFields = headers
        return request
    }
    
}
