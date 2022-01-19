//
//  DetailViewController.swift
//  NewsApps
//
//  Created by Muhammad Adhi on 19/01/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var titleData:String?
    var contentData:String?
    var dateData:String = ""
    var urlData:String?
    var urlToImageData:String?
    var mediaData:String?
    
    @IBOutlet weak var imNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var contentNews: UILabel!
    @IBOutlet weak var dateNews: UILabel!
    @IBOutlet weak var mediaNews: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleNews.text = titleData
        contentNews.text = contentData
        dateNews.text = dateData
        mediaNews.text = mediaData
        getDataImage()
    }
    
    func getDataImage(){
        imNews.kf.indicatorType = .activity
        imNews.kf.setImage(with: URL(string: urlToImageData!), placeholder: nil, options: nil)
    }
    
    
        
    @IBAction func btnSource(_ sender: Any) {
        if let url = URL(string: urlData!) {
            UIApplication.shared.open(url)
        }
    }
    
}
