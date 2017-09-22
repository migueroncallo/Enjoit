//
//  RestaurantFeedViewController.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/22/17.
//
//

import UIKit
import NVActivityIndicatorView
import Kingfisher

class RestaurantFeedViewController: UIViewController,  NVActivityIndicatorViewable{

    @IBOutlet weak var tableView: UITableView!
    
    var restaurants = [Restaurant]()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        loadRestaurants()
    }
    
    //MARK: - Internal Helpers
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        self.tableView.register(UINib(nibName: "RestaurantFeedTableViewCell", bundle: nil), forCellReuseIdentifier: RestaurantFeedTableViewCell.CellIdentifier)
    }
    
    func loadRestaurants(){
        startAnimating()
        
        RestaurantAPI().getAllRestaurants { (restaurants, error) in
            self.stopAnimating()
            if restaurants != nil{
                self.restaurants = restaurants!
                self.tableView.reloadData()
            }else{
                self.presentAlert(text: "Error al cargar los restaurantes")
            }
        }
    }
}

extension RestaurantFeedViewController: UITableViewDataSource{
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Present restaurant detail")
    }
}

extension RestaurantFeedViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantFeedTableViewCell.CellIdentifier, for: indexPath) as! RestaurantFeedTableViewCell
        
        let url = URL(string:"https://s3.amazonaws.com/muitipos/android/\(restaurants[indexPath.row].logoImage!)")
        cell.restaurantImageView.kf.setImage(with: url)
        cell.restaurantNameLabel.text = restaurants[indexPath.row].name
        cell.restaurantDistanceLabel.isHidden = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurants.count
        
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
