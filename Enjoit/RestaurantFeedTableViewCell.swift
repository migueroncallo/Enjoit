//
//  RestaurantFeedTableViewCell.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/22/17.
//
//

import UIKit

class RestaurantFeedTableViewCell: UITableViewCell {

    static let CellIdentifier = "RestaurantFeedCell"
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    @IBOutlet weak var restaurantDistanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
