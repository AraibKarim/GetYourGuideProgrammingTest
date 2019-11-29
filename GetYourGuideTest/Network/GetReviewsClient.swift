//
//  GetReviewsClient.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation

final class GetReviewsClient {
    private lazy var baseURL: URL = {
        return URL(string: "https://www.getyourguide.com/")!
    }()
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchReviews(with request: GetReviewsRequest, limit: Int,offset : Int, completion: @escaping (Result<GetReviewResponse, DataResponseError>) -> ()) {
        
        let urlRequest = URLRequest(url: baseURL.appendingPathComponent(request.path))
        
        let parameters = ["limit": "\(limit)", "offset": "\(offset)"].merging(request.parameters, uniquingKeysWith: +)
              
        let encodedURLRequest = urlRequest.encode(with: parameters)
        
        session.dataTask(with: encodedURLRequest, completionHandler: { data, response, error in
            if error != nil {
                guard
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.hasSuccessStatusCode,
                    let _ = data
                else {
                    completion(.failure(DataResponseError.network))
                    return
                }
            }
            
            // successful
            do {
                let getReviewResponse = try JSONDecoder().decode(GetReviewResponse.self, from: data!)
                completion(.success(getReviewResponse))
             
                
            } catch let jsonError {
            //error
                print(jsonError)
                completion(.failure(DataResponseError.decoding))
            }
            
          }).resume()
    }
    
    
}
