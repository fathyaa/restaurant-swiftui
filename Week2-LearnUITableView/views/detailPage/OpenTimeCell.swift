//
//  OpenTimeCell.swift
//  Week2-LearnUITableView
//
//  Created by Phincon on 23/02/23.
//

import UIKit

class OpenTimeCell: UITableViewCell {
    static let id = "OpenTimeCell"
    @IBOutlet weak var openTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
