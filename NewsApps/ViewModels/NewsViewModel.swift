//
//  NewsViewModel.swift
//  NewsApps
//
//  Created by Muhammad Adhi on 19/01/22.
//

import Foundation

class NewsViewModel : NSObject {
    
    private var apiService : APIService!
    
    //binding Data
    private(set) var newsData: News!{
        didSet{
            self.bindNewsViewModelToController()
        }
    }
    
    //property viewmodel to call in Controller
    var bindNewsViewModelToController : (() -> ()) = {
        
    }
    
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetNewsData()
    }
    
    func callFuncToGetNewsData() {
        self.apiService.apiGetDataNews { (newsData) in
            self.newsData = newsData
        }
    }
    
    func testData(){
        print("testData")
    }
    
    
}


