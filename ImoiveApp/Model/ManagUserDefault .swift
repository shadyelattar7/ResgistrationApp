//
//  ManagUserDefault .swift
//  ImoiveApp
//
//  Created by Elattar on 7/8/19.
//

import Foundation
import UIKit

class ManagerUserDefault {
    
    private init(){}
    
    static let shared = ManagerUserDefault()
    
    let def = UserDefaults.standard
    
    var userData: User? {
        get{
            if let saveUser = def.object(forKey: UserDefaultKey.userData) as? Data {
                let decoded = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(saveUser) as! User
                return decoded as! User
            }
            return nil
        } set {
            if let saveData = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false){
                let def = UserDefaults.standard
                def.set(saveData, forKey: UserDefaultKey.userData)
            }
        }
    }
    
    
//    var isLogIn: Bool?{
//        get{
//            guard let logIn = def.object(forKey:UserDefaultKey.logIn ) as? Bool else {
//                return false
//            }
//            return logIn
//
//        }set{
//            def.set(newValue, forKey: UserDefaultKey.logIn)
//        }
//    }
//
//
//    func clearUserData () {
//
//        self.isLogIn = false
//    }
    
    var isLogIn: Bool? {
        
        get{
            guard let logIn = def.object(forKey: UserDefaultKey.logIn) as? Bool else {
                return false
            }
            return logIn
            
        }set{
            def.set(newValue, forKey: UserDefaultKey.logIn)
        }
    }
    
    func clearData()  {
        self.isLogIn = false
    }
}
