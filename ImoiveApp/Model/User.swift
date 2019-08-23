//
//  Person.swift
//  ImoiveApp
//
//  Created by Elattar on 7/8/19.
//

import Foundation
import UIKit

class User: NSObject, NSCoding{

    var name: String!
    var email: String!
    var password: String!
    var address: [String]!
    var phone: String!
    var image: UIImage!
    
    
   
    
    init(name: String, email: String, password: String, address: [String], phone: String ,image: UIImage) {
        
        self.name = name
        self.email = email
        self.password = password
        self.address = address
        self.phone = phone
        self.image = image
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: UserDefaultKey.name) as? String ?? ""
        email = aDecoder.decodeObject(forKey: UserDefaultKey.email) as? String ?? ""
        password = aDecoder.decodeObject(forKey: UserDefaultKey.password) as? String ?? ""
        address = aDecoder.decodeObject(forKey: UserDefaultKey.address) as? [String]
        phone = aDecoder.decodeObject(forKey: UserDefaultKey.phone) as? String ?? ""
        image = aDecoder.decodeObject(forKey: UserDefaultKey.image) as? UIImage
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: UserDefaultKey.name)
        aCoder.encode(email, forKey: UserDefaultKey.email)
        aCoder.encode(password, forKey: UserDefaultKey.password)
        aCoder.encode(address, forKey: UserDefaultKey.address)
        aCoder.encode(phone, forKey: UserDefaultKey.phone)
        aCoder.encode(image, forKey: UserDefaultKey.image)
    }
    
}

