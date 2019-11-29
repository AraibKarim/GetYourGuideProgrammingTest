//
//  ReviewsViewModal.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import Foundation



protocol ReviewsListViewModelDelegate: class {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}
final class ReviewsListViewModel{
    private weak var delegate: ReviewsListViewModelDelegate?
    
    let client = GetReviewsClient()
    private var reviews: [ReviewViewModel] = []
    private var page = 0
    private var limit = 10
    private var average_rating = 0.0
    private var offset = 0
    private var total = 0
    private var isFetchInProgress = false
    let request: GetReviewsRequest
    
    init(request: GetReviewsRequest, delegate: ReviewsListViewModelDelegate) {
        self.request = request
        self.delegate = delegate
    }
    var totalCount: Int {
        return total
    }
    var averageRating : String {
        
        return "\(average_rating.rounded(toPlaces: 1))" + " out of 5 stars"
    }
    var totalReviews : String {
        
        return "Total Reviews: " + "\(total)"
    }
    var currentCount: Int {
        return reviews.count
    }
    func review(at index: Int) -> ReviewViewModel {
        return reviews[index]
    }
    
    func fetchReviews() {
        
        
        guard !isFetchInProgress else {
            return
        }
        
        
        isFetchInProgress = true
        
        client.fetchReviews(with: request, limit: limit, offset: offset ) { result in
            switch result {
            
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    self.delegate?.onFetchFailed(with: error.reason)
                }
            
            case .success(let response):
                DispatchQueue.main.async {
                     
                    self.offset += self.limit
                    self.page += 1
                    self.isFetchInProgress = false
                    self.average_rating =  response.averageRating
                    self.total = response.totalCount
                    
                    //adding new rows
                    response.reviews.forEach({ (review) in
                        let reviewViewModel = ReviewViewModel (reviewModel: review)
                        self.reviews.append (reviewViewModel)
                    })
                    
                    
                    if self.page > 1 {
                        let indexPathsToReload = self.calculateIndexPathsToReload(from: response.reviews)
                        self.delegate?.onFetchCompleted(with: indexPathsToReload)
                    } else {
                        self.delegate?.onFetchCompleted(with: .none)
                    }
                }
            }
        }
    }
    
    private func calculateIndexPathsToReload(from newReviews: [Review]) -> [IndexPath] {
        let startIndex = reviews.count - newReviews.count
        let endIndex = startIndex + newReviews.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
    
}
