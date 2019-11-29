//
//  GetReviewResponse.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation


struct GetReviewResponse : Decodable {
    let reviews : [Review]
    let totalCount : Int
    let averageRating : Double
    let pagination : Pagination
    
    enum CodingKeys: String, CodingKey {
      case reviews
      case totalCount
      case averageRating
      case pagination
    }
}
