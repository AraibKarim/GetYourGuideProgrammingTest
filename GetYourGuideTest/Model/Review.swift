//
//  Review.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation

struct Review : Codable {
    let id: Int
    let author: Author?
    let title : String?
    let message : String?
    let enjoyment : String?
    let isAnonymous : Bool?
    let rating : Int
    let created : String?
    let language : String?
    let travelerType : String?
    
  enum CodingKeys: String, CodingKey {
        case id
        case author
        case title
        case message
        case enjoyment
        case isAnonymous
        case rating
        case created
        case language
        case travelerType
  }
  
    init(id: Int,  author: Author, title : String, message : String, enjoyment : String,
         isAnonymous : Bool, rating : Int, created : String, language : String, travelerType : String) {
    self.id = id
    self.author = author
    self.title = title
    self.message = message
    self.enjoyment = enjoyment
    self.isAnonymous = isAnonymous
    self.rating = rating
    self.created = created
    self.language = language
    self.travelerType = travelerType
    
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int.self, forKey: .id)
    author = try values.decodeIfPresent(Author.self, forKey: .author)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    message = try values.decodeIfPresent(String.self, forKey: .message)
    enjoyment = try values.decodeIfPresent(String.self, forKey: .enjoyment)
    isAnonymous = try values.decodeIfPresent(Bool.self, forKey: .isAnonymous)
    rating = try values.decode(Int.self, forKey: .rating)
    created = try values.decodeIfPresent(String.self, forKey: .created)
    language = try values.decodeIfPresent(String.self, forKey: .language)
    travelerType = try values.decodeIfPresent(String.self, forKey: .travelerType)
   /* self.init(id: id,  author: author, title : title, message : message, enjoyment : enjoyment,
    isAnonymous : isAnonymous, rating : rating, created : created, language : language, travelerType : travelerType)*/
  }
}
