//
//  DetailRestaurantViewController.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class DetailRestaurantViewController: UIViewController {
    
    // inisialisasi model restaurantstruct
    var restaurant: RestaurantStruct?
    
    // inisialisasi iboutlet di storyboard Main
    @IBOutlet weak var detailRestaurantTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    // regist tableview detail restaurant, pakai nib karena dia XIB
    func setUpTableView(){
        let detailRestaurantNib = UINib(nibName: "RestaurantTitleCell", bundle: nil)
        let aboutNib = UINib(nibName: "AboutCell", bundle: nil)
        let titleNib = UINib(nibName: "TitleCell", bundle: nil)
        let addressNib = UINib(nibName: "AddressCell", bundle: nil)
        let openTimeNib = UINib(nibName: "OpenTimeCell", bundle: nil)
        let detailImageNib = UINib(nibName: "DetailImageCell", bundle: nil)
        detailRestaurantTableView.register(aboutNib, forCellReuseIdentifier: AboutCell.id)
        detailRestaurantTableView.register(detailRestaurantNib, forCellReuseIdentifier: RestaurantTitleCell.id)
        detailRestaurantTableView.register(titleNib, forCellReuseIdentifier: TitleCell.id)
        detailRestaurantTableView.register(addressNib, forCellReuseIdentifier: AddressCell.id)
        detailRestaurantTableView.register(openTimeNib, forCellReuseIdentifier: OpenTimeCell.id)
        detailRestaurantTableView.register(detailImageNib, forCellReuseIdentifier: DetailImageCell.id)
        detailRestaurantTableView.delegate = self
        detailRestaurantTableView.dataSource = self
        detailRestaurantTableView.separatorStyle = .none
    }

}

extension DetailRestaurantViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // identifiernya dari class XIB ye
        switch indexPath.section {
        case 0 :
            guard let cell = detailRestaurantTableView.dequeueReusableCell(withIdentifier: TitleCell.id, for: indexPath) as? TitleCell else{
                return UITableViewCell()
            }
            cell.restaurantTitle.text = restaurant?.tittle
            return cell
        case 1 :
            guard let cell = detailRestaurantTableView.dequeueReusableCell(withIdentifier: AddressCell.id, for: indexPath) as? AddressCell else{
                return UITableViewCell()
            }
            cell.addressLabel.text = restaurant?.adress
            return cell
        case 2 :
            guard let cell = detailRestaurantTableView.dequeueReusableCell(withIdentifier: OpenTimeCell.id, for: indexPath) as? OpenTimeCell else{
                return UITableViewCell()
            }
            return cell
        case 3 :
            guard let cell = detailRestaurantTableView.dequeueReusableCell(withIdentifier: DetailImageCell.id, for: indexPath) as? DetailImageCell else{
                return UITableViewCell()
            }
            cell.detailImage.image = UIImage(named: restaurant?.image ?? "Image")
            return cell
        case 4 :
            guard let cell = detailRestaurantTableView.dequeueReusableCell(withIdentifier: RestaurantTitleCell.id, for: indexPath) as? RestaurantTitleCell else{
                return UITableViewCell()
            }
            
            cell.setupOrderCell()
            
            // atur yang mau ditampilin
            cell.getDataFromDetail(restaurant)
            return cell
        case 5 :
            guard let aboutcell = detailRestaurantTableView.dequeueReusableCell(withIdentifier: AboutCell.id, for: indexPath) as? AboutCell else{
                return UITableViewCell()
            }
            
            return aboutcell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
}
