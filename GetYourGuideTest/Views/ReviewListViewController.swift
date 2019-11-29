//
//  ViewController.swift
//  GetYourGuideTest
//
//  Created by Araib on 28/11/2019.
//  Copyright © 2019 araibkarim. All rights reserved.
//

import UIKit

class ReviewListViewController: UIViewController, AlertDisplayer {
    // MARK: Properties
    private enum CellIdentifiers {
        static let list = "reviewCell"
    }
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var totalReviewsLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!
    
    
    
    private var viewModel: ReviewsListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        indicatorView.color = UIColor.orange
        indicatorView.startAnimating()
        tableView.isHidden = true
        tableView.separatorColor = UIColor.gray
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.backgroundColor = UIColor.clear
        let request = GetReviewsRequest.build()
        viewModel = ReviewsListViewModel(request: request, delegate: self)
        viewModel.fetchReviews()
    }
    
    
}
// MARK: TableViewDataSource
extension ReviewListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.totalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.list, for: indexPath) as! ReviewsTableViewCell
        
        if isLoadingCell(for: indexPath) {
            cell.configure(with: .none)
        } else {
            cell.configure(with: viewModel.review(at: indexPath.row))
        }
        return cell
    }
}

// MARK: TableViewDataSourcePrefetching
extension ReviewListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            viewModel.fetchReviews()
        }
    }
}

// MARK: Fetch Delegate Methods
extension ReviewListViewController: ReviewsListViewModelDelegate {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
       
        guard let newIndexPathsToReload = newIndexPathsToReload else {
            
            indicatorView.stopAnimating()
            indicatorView.isHidden =  true
            tableView.isHidden = false
            
            setAverageRating ()
            setTotalRatingCount ()
            tableView.reloadData()
            return
        }
        
        let indexPathsToReload = visibleIndexPathsToReload(intersecting: newIndexPathsToReload)
        tableView.reloadRows(at: indexPathsToReload, with: .automatic)
        
        
    }
    
    func onFetchFailed(with reason: String) {
        
        indicatorView.stopAnimating()
        indicatorView.isHidden =  true
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        displayAlert(with: title , message: reason, actions: [action])
    }
}

private extension ReviewListViewController {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        print("row","\(indexPath.row)")
        return indexPath.row >= viewModel.currentCount
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}
private extension ReviewListViewController {
    
    func setAverageRating (){
        self.averageRatingLabel.text = viewModel.averageRating
    }
    func setTotalRatingCount (){
        self.totalReviewsLabel.text = viewModel.totalReviews
    }
}
