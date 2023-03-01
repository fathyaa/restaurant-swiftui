//
//  ListFoodTypeCollectionViewCell.swift
//  Week2-LearnUITableView
//
//  Created by Phincon on 01/03/23.
//

import UIKit

class ListFoodTypeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ListFoodTypeCollectionViewCell"
    @IBOutlet weak var viewCol: UIView!
    @IBOutlet weak var imageCol: UIImageView!
    @IBOutlet weak var restaurantTitle: UILabel!
    @IBOutlet weak var restaurantDesc: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
