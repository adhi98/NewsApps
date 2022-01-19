//
//  APIService.swift
//  NewsApps
//
//  Created by Muhammad Adhi on 19/01/22.
//

import Foundation
import Alamofire

class APIService : NSObject {
    
    private let sourcesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=id&apiKey=08249b0408194937a52b6fd82497aacc")!
    
    //func get Data API
    func apiGetDataNews(completion: @escaping (News) -> ()){
        AF.request("https://newsapi.org/v2/top-headlines?country=id&apiKey=08249b0408194937a52b6fd82497aacc").responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let data = response.data {
                    do {
                        let decodedData = try JSONDecoder().decode(News.self, from: data)
                        print("decodedData \(decodedData.totalResults)")
                        completion(decodedData)
                    }catch {
                        print("error Decoder")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
}
