//
//  DataResponseError.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation



enum DataResponseError: Error {
  case network
  case decoding
  
  var reason: String {
    switch self {
    case .network:
      return "An error occurred while fetching data "
    case .decoding:
      return "An error occurred while decoding data"
    }
  }
}
