//
//  ListRestaurantCell.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class ListRestaurantCell: UITableViewCell {
    
    static let identifier = "listRestaurant"
    
    @IBOutlet weak var restaurantPrice: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantDesc: UILabel!
    @IBOutlet weak var restaurantTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
