//
//  UserAPI.swift
//  Enjoit
//
//  Created by Miguel Roncallo on 9/4/17.
//
//

import Foundation
import Alamofire
import CryptoSwift
import SwiftyJSON

class UserAPI{
    
    var currentUser: User?
    
    func logIn(email: String, password: String, cb: @escaping ((User?, Error?)->())){
        
        let encryptedPassword = password.md5()
        
        let url = URL(string: "\(Constants.baseURL)user/srvuser.svc/authenticate")!
        
        let params = ["Correo": email,
                      "Clave": encryptedPassword]
        var jsonData = Data()
        
        do {
            jsonData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        Alamofire.request(request)
            .validate()
            .responseJSON { (response) in
                
                switch response.result{
                case .success:
                    
                    if let value = response.result.value{
                        
                        let json = JSON(value)
                        print(json)
                        let user = User().userFromJson(json: json)
                        print("User parsed")
                        self.currentUser = user
                        cb(user, nil)
                        
                    }
                    
                case .failure(let error):
                    self.currentUser = nil
                    cb(nil, error)
                }
                
        }
        
    }
    
    func register(email: String, password: String, name: String, lastName: String, phone: String, id: String, cb: @escaping ((Bool)->())){
        
        let url = URL(string: "\(Constants.baseURL)user/srvuser.svc/create")!
        let encryptedPassword = password.md5()
        
        let params = ["Apellido": lastName,
                      "Cedula": id,
                      "Clave": encryptedPassword,
                      "Correo": email,
                      "Nombre": name,
                      "Status": "Nuevo",
                      "Telefono": phone]
        var jsonData = Data()
        
        do {
            jsonData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        Alamofire.request(request)
            .validate()
            .responseJSON { (response) in
                
                switch response.result{
                case .success:
                    cb(true)
                    
                case .failure:
                    cb(false)
                }
        }
        
        
    }
    
}
