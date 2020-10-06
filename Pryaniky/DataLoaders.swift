//
//  DataLoaders.swift
//  Pryaniky
//
//  Created by Mikhail Danilov on 29.09.2020.
//

import Foundation
import Alamofire

class DataLoaders{
    func loadData(completition: @escaping (PurpleData) -> Void){
//        let myUrl = "https://pryaniky.com/static/json/sample.json"
//        let myUrl = "https://chat.pryaniky.com/json/data-custom-selected-id.json"
//        let myUrl = "https://chat.pryaniky.com/json/data-custom-order-much-more-items-in-data.json"
        let myUrl = "https://chat.pryaniky.com/json/data-default-order-custom-data-in-view.json"
        
        AF.request(myUrl, method: .get).responseDecodable { (response: DataResponse<PurpleData, AFError>) in
                    if let purpleData = response.value {
                        completition(purpleData)
                    } else {
                        if let error = response.error{
                            print("API error with message: \(error)")
                        }
                }
            }
        
}

}
