//
//  Post.swift
//  ImoiveApp
//
//  Created by Elattar on 8/1/19.
//

import Foundation


struct Poste: Codable {
    
    var userId: Int
    var id: Int
    var myTitle: String
    var body: String
    
    
    private enum CodingKeys: String, CodingKey{
        
        case userId
        case id
        case myTitle = "title"
        case body
    }
    
}
