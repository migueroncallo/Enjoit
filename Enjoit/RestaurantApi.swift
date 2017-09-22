//
//  RestaurantApi.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/21/17.
//
//

import Foundation
import Alamofire
import SwiftyJSON

class RestaurantAPI{
    
    func getAllRestaurants(cb: @escaping (([Restaurant]?, Error?)->())){
        let url = URL(string: "\(Constants.baseURL)resta/srvrestaurante.svc/findall")
        Alamofire.request(url!, method: .get)
        .validate()
        .responseJSON { (response) in
            print(response)
            
            switch response.result{
            case .success:
                if let value = response.result.value{
                    
                    let json = JSON(value)
                    print(json)
                    var restaurants = [Restaurant]()
                    for  (_,subJson):(String, JSON) in json{
                        restaurants.append(Restaurant().restaurantFromJson(json: subJson))
                    }
                    
                    cb(restaurants, nil)
                    
                }
                
            case .failure(let error):
                cb(nil, error)
            }
        }
    }
    
    
}
