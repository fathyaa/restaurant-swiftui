//
//  FoodTypeColTableViewCell.swift
//  Week2-LearnUITableView
//
//  Created by Phincon on 01/03/23.
//

import UIKit

class FoodTypeColTableViewCell: UITableViewCell {
    
    static let identifier = "FoodTypeColTableViewCell"
    var restaurant: [RestaurantStruct]?
    
    @IBOutlet weak var foodTypeCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    private func setupCollectionView(){
        foodTypeCollectionView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        foodTypeCollectionView.delegate = self
        foodTypeCollectionView.dataSource = self
        foodTypeCollectionView.register(UINib(nibName: "ListFoodTypeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ListFoodTypeCollectionViewCell.identifier)
    }
    
}

extension FoodTypeColTableViewCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurant?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = foodTypeCollectionView.dequeueReusableCell(withReuseIdentifier: ListFoodTypeCollectionViewCell.identifier, for: indexPath) as? ListFoodTypeCollectionViewCell else { return UICollectionViewCell() }
        
        if let restaurant = restaurant {
            cell.restaurantTitle.text = restaurant[indexPath.row].tittle
            cell.restaurantDesc.text = restaurant[indexPath.row].desc
            cell.price.text = "$\(restaurant[indexPath.row].price)"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
