//
//  Order.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/11/17.
//
//

import Foundation
import SwiftyJSON

class Order{
    
    var date: String!
    var idStatus: Int!
    var idOrder: Int!
    var idOwner: Int!
    var ownerName: String!
    var orderNumber: String!
    var productsOrdered: [Dishes]!
    var total: String!
    var typeOwner: String!
}
