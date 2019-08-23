//
//  String+Tirm.swift
//  ImoiveApp
//
//  Created by Elattar on 7/7/19.
//

import Foundation
import UIKit




extension String{
    
    var trim: String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isBlank: Bool{
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}




// 3shan check 3la ay optional lma ykon men no3 string
//extension Optional where Wrapped == String{
//
//    var trim: String{
//        return self!.trimmingCharacters(in: .whitespacesAndNewlines)
//    }
//
//    var isBlank: Bool{
//
//        return self == nil || self!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
//    }
//
//
//}


