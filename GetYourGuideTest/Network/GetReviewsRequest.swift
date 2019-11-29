//
//  ReviewRequest.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation


struct GetReviewsRequest {
  var path: String {
    return "travelers-api-forwarding/travelers/activities/23776/reviews"
  }
  
  let parameters: Parameters
  private init(parameters: Parameters) {
    self.parameters = parameters
  }
}

extension GetReviewsRequest {
  static func build() -> GetReviewsRequest {
     //can add any default parameters here.
     let parameters : Parameters = Parameters()
     return GetReviewsRequest(parameters: parameters)
  }
}
