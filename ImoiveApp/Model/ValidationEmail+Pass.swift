//
//  ValidationEmail+Pass.swift
//  ImoiveApp
//
//  Created by Elattar on 7/7/19.
//

import Foundation

class Validation {
    
    
   static func isValidPassword(password: String) -> Bool{
        
        var count = 0
        for i in password.characters{
            count += 1
        }
        if count < 8 {
            return false
        }else{
            return true
        }
        
    }
    

   static func isValidEmail(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    
}
