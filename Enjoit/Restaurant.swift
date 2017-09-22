//
//  Restaurant.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/11/17.
//
//

import Foundation
import SwiftyJSON

class Restaurant{
    var descripcion: String!
    var address: String!
    var idRestaurant: Int!
    var logoImage: String!
    var longitude: Double!
    var name: String!
    var rating: String!
    var latitude: Double!
    var status: String!
    
    func restaurantFromJson(json: JSON) -> Restaurant{
        let rest = Restaurant()
        
        rest.descripcion = json["Descripcion"].stringValue
        rest.address = json["Direccion"].stringValue
        rest.idRestaurant = json["IdRestaurante"].intValue
        rest.logoImage = json["Logo"].stringValue
        rest.longitude = json["Longitud"].doubleValue
        rest.latitude = json["latitud"].doubleValue
        rest.name = json["Nombre"].stringValue
        rest.rating = json["Rating"].stringValue
        rest.status = json["status"].stringValue
    
        return rest
    }
}
