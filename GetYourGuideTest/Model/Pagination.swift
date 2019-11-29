//
//  File.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation

struct Pagination : Decodable{
    let limit : Int
    let offset : Int
    
    enum CodingKeys: String, CodingKey {
      case limit
      case offset
    }
}
