//
//  URLRequest.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation

typealias Parameters = [String: String]


extension URLRequest {
  func encode(with parameters: Parameters?) -> URLRequest {
    guard let parameters = parameters else {
      return self
    }
    
    var encodedURLRequest = self
    
    if let url = self.url,
       let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
       !parameters.isEmpty {
      var newUrlComponents = urlComponents
      let queryItems = parameters.map { key, value in
        URLQueryItem(name: key, value: value)
      }
      newUrlComponents.queryItems = queryItems
      encodedURLRequest.url = newUrlComponents.url
      return encodedURLRequest
    } else {
      return self
    }
  }
    
}
