//
//  ReviewViewModal.swift
//  GetYourGuideTest
//
//  Created by Araib on 29/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation


struct ReviewViewModel {
    private let model: Review
    
    init(reviewModel: Review) {
        self.model = reviewModel
    }
    var title : String {
        
        return model.title ?? ""
    }
    
    var enjoyment : String {
        
        return model.enjoyment ?? ""
    }
    
    var message : String {
        
        return model.message ?? ""
    }
    
    var ratingStars: String {
        let rating = model.rating
        var ratingString = String ()
        for _ in 0..<rating {
            
            ratingString = ratingString + "⭐️"
        }
        
        return ratingString
    }
    
    var reviewDetails: String {
        
        var reviewDetails = String ()
        if let author = model.author {
            if model.isAnonymous ?? false {
                reviewDetails = "Anonymous ‧ " + (author.country ?? "")
            }else {
                reviewDetails = (author.fullName ?? "") + " ‧ " + (author.country ?? "")
            }
        }
        if let createdDate = model.created {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd-MMM-yyyy"
            if let date = dateFormatterGet.date(from: createdDate) {
                reviewDetails = reviewDetails + " ‧ " + dateFormatterPrint.string(from: date)
            } else {
                
            }
        }
        
        return reviewDetails
    }
}
