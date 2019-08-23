//
//  APIManager.swift
//  ImoiveApp
//
//  Created by Elattar on 7/25/19.
//

import Foundation
import UIKit
import Alamofire

class APIManager {
    
    static func getPostes(completion: @escaping (_ error: String?, _ posts: [Poste]?) -> Void){
        let url = "https://jsonplaceholder.typicode.com/posts"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (respones) in
            
            switch respones.result{
            case .failure(let error):
                print("Error while fetching data: \(error.localizedDescription)")
                completion(error.localizedDescription,nil)
                
            case .success(_):
                print(respones.result.value)
                guard let data = respones.data else {
                    print("Error whiles fetching data: didn't get any data from API")
                    completion("didin't get any data from API",nil)
                    return
                }
                do{
                    let posts = try JSONDecoder().decode([Poste].self,from: data)
                    completion(nil,posts)
                    
                }catch{
                    print("Error trying to decode response")
                    print(error.localizedDescription)
                    completion(error.localizedDescription,nil)
                }
                
           
            }
        }
        
    }
    
}
