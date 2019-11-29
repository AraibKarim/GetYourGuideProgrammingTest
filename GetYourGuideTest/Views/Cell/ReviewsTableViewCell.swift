//
//  ReviewsTableViewCell.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var reviewDetailsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         selectionStyle = .none
    }
    func configure(with reviewViewModel: ReviewViewModel?) {
       if let reviewViewModel = reviewViewModel {
         ratingLabel?.text = reviewViewModel.ratingStars
         messageLabel?.text = reviewViewModel.message
         reviewDetailsLabel?.text = reviewViewModel.reviewDetails
         titleLabel?.text = reviewViewModel.title
       } else {
         ratingLabel?.text = ""
         messageLabel?.text = ""
         reviewDetailsLabel?.text = ""
         titleLabel?.text = ""
         
       }
     }
    
}
