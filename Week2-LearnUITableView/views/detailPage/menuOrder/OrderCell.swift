//
//  OrderCell.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class OrderCell: UITableViewCell {

    static let identifier = "orderCell"
    @IBOutlet weak var menuOrderLabel: UILabel!
    @IBOutlet weak var priceOrderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
