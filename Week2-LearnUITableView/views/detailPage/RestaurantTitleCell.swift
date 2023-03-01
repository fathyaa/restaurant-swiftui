//
//  RestaurantTitleCell.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class RestaurantTitleCell: UITableViewCell {
    
    // inisialisasi object di XIB
    @IBOutlet weak var restaurantTitle: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantAbout: UILabel!
    
    // inisialisasi model restaurantstruct
    var restaurant: RestaurantStruct?
    static let id = "RestaurantTitleCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupOrderCell()
    }
    
    // ambil data dari model
    func getDataFromDetail(_ restaurant: RestaurantStruct!) {
        self.restaurant = restaurant
    }
    
    // regist tableview OrderCell, pake nib karena XIB
    func setupOrderCell(){
        let orderCellNib = UINib(nibName: "OrderCell", bundle: nil)
        orderTableView.register(orderCellNib, forCellReuseIdentifier: "orderCell")
        orderTableView.delegate = self
        orderTableView.dataSource = self
        // ngatur jarak bawah tablenya
        orderTableView.estimatedRowHeight = 40.0;
    }
    
}

extension RestaurantTitleCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = orderTableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as? OrderCell else { return UITableViewCell()}
        
        //ambil data menu dari array orders di restaurantstruct
        cell.menuOrderLabel.text = restaurant?.orders[indexPath.row].menu
        
        // ambil data price dari array orders jg trs pake guard let biar gak ada tulisan option gt
        guard let foodPrice = restaurant?.orders[indexPath.row].price else { return UITableViewCell() }
        cell.priceOrderLabel.text = "$\(foodPrice)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionCount = restaurant?.orders.count else { return 0}
        
        return (sectionCount)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
