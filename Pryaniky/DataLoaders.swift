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
        let myUrl = "https://pryaniky.com/static/json/sample.json"
        
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
