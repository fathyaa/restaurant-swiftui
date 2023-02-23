//
//  ViewController.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class ListFoodTypeViewController: UIViewController {
    
    // array untuk list food type
    var restaurantCategories: [FoodCategories] = []
    

    // yang ditarik dari storyboard Main, page tableview
    @IBOutlet weak var listFoodTypeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        dataSeeder()
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(menuClicked))]
        
    }
    
    func dataSeeder() {
        let data1 = FoodCategories(category: "Latino", resto:
                                        [RestaurantStruct(tittle: "El Pachucho", desc: "Best Nachos in Town", price: 15, adress: "gandaria", orders:
                                                            //restaurantstruct kaya punya anak orders gitu
                                                            [
                                                                Orders(menu: "The Fried Chicken Bun", price: 12),
                                                                Orders(menu: "Tacos Criollo", price: 12 ),
                                                                Orders(menu: "Pancakes", price: 6),
                                                                Orders(menu: "Tehgelas", price: 6),
                                                                Orders(menu: "Tehgelas", price: 6),
                                                                Orders(menu: "Tehgelas", price: 6)
                                                            ], image: "Image"),
                                        RestaurantStruct(tittle: "Taco Alto", desc: "Mexican-American", price: 15, adress: "cikampek", orders:
                                                            [
                                                                Orders(menu: "Sate", price: 8),
                                                                
                                                            ],
                                                         image: "Image2"),
                                        RestaurantStruct(tittle: "La Taquera", desc:"Asian-Indonesia" , price: 9, adress: "cirebon", orders:
                                                            [Orders(menu: "seblak", price: 10)], image: "Image3")]
                                    )
        
        restaurantCategories.append(data1)
    }
    
    // regist tableview food type-nya, pakai nib soalnya dia XIB
    func setupTableView() {
        let listFoodTypeNib = UINib(nibName: "ListFoodTypeCell", bundle: nil)
        listFoodTypeTableView.register(listFoodTypeNib, forCellReuseIdentifier: "foodTypeCell")
        listFoodTypeTableView.delegate = self
        listFoodTypeTableView.dataSource = self
       
    }
    
    @objc func menuClicked(){
        print("yh")
    }
    
    func navigateToDetail(_ restaurant: [RestaurantStruct]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detail = storyboard.instantiateViewController(withIdentifier: "restaurantListIdentifier") as! RestaurantListViewController
        detail.restaurant = restaurant
        navigationController?.pushViewController(detail, animated: true)
    }

}

extension ListFoodTypeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // munculin cell list food type
        guard let cell = listFoodTypeTableView.dequeueReusableCell(withIdentifier: "foodTypeCell", for: indexPath) as? ListFoodTypeCell else {return UITableViewCell()}
        cell.foodTypeLabel.text = restaurantCategories[indexPath.row].category
        cell.placeCountButton.setTitle("\(restaurantCategories[indexPath.row].resto.count) places", for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // munculin 5 baris
        return restaurantCategories.count
    }
    
    
    // buat arahin cell list food type ke halaman list restaurant
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetail(restaurantCategories[indexPath.row].resto)
    }
}
