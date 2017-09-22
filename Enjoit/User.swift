//
//  User.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/4/17.
//
//

import Foundation
import SwiftyJSON

class User{
    var apellido: String!
    var cedula: String!
    var correo: String!
    var nombre: String!
    var status: String!
    var telefono: String!
    var id: Int!
    
    func userFromJson(json: JSON) -> User{
        let user = User()
        
        user.nombre = json["Nombre"].stringValue
        user.apellido = json["Apellido"].stringValue
        user.cedula = json["Cedula"].stringValue
        user.correo = json["Correo"].stringValue
        user.status = json["Status"].stringValue
        user.id = json["idUser"].intValue
        user.telefono = json["Telefono"].stringValue
        
        return user
    }
}
