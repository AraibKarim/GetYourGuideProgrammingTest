//
//  Author.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation

struct Author : Codable {
    let fullName : String?
    let country : String?
    
    enum CodingKeys: String, CodingKey {
          case fullName
          case country
    }
    
    init(fullName: String, country: String) {
      self.fullName = fullName
      self.country = country
    }
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
       fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
       country = try container.decodeIfPresent(String.self, forKey: .country)
     }
}
