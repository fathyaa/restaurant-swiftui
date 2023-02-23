//
//  RestaurantListViewController.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class RestaurantListViewController: UIViewController {
    
    var restaurant: [RestaurantStruct] = []
    
    static let identifier = "pageListId"
    
    // inisialisasi table view restaurant list di storyboard
    @IBOutlet weak var restaurantListView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    // regist tableview list restaurant, pakai nib karena dia bentuknya XIB
    func setUpTableView(){
        let listRestaurantNib = UINib(nibName: "ListRestaurantCell", bundle: nil)
        restaurantListView?.register(listRestaurantNib, forCellReuseIdentifier: "listRestaurant")
        restaurantListView?.delegate = self
        restaurantListView?.dataSource = self
    }
    
    // fungsi untuk ngarahin ke detail
    func navigateToDetail(_ restaurant: RestaurantStruct?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detail = storyboard.instantiateViewController(withIdentifier: "restaurantDetail") as! DetailRestaurantViewController
        detail.restaurant = restaurant
        navigationController?.pushViewController(detail, animated: true)
//        let vc = RestaurantListViewController()
//        vc.restaurant = restaurant
//        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RestaurantListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // identifiernya dari class XIB ya
        guard let cell = restaurantListView?.dequeueReusableCell(withIdentifier: "listRestaurant", for: indexPath) as? ListRestaurantCell else{
            return UITableViewCell()
        }
        
        // atur yang mau dimunculin
        cell.restaurantTitle.text = restaurant[indexPath.row].tittle
        cell.restaurantDesc.text = restaurant[indexPath.row].desc
        cell.restaurantPrice.text = "$ \(restaurant[indexPath.row].price)"
        cell.restaurantImage.image = UIImage(named: restaurant[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //untuk arahin ke detail restaurant
        navigateToDetail(restaurant[indexPath.row])
    }
}



