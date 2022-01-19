//
//  ViewController.swift
//  NewsApps
//
//  Created by Muhammad Adhi on 19/01/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var newsViewModel : NewsViewModel!
    var dataNews = [Articles]()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPrepare()
        callToViewModelForUIUpdate()
    }
    
    func tableViewPrepare(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }
    
    func callToViewModelForUIUpdate(){
        print("callToViewModelForUIUpdateWorks")
        self.newsViewModel = NewsViewModel()
        self.newsViewModel.bindNewsViewModelToController = {
            self.updateDataSource()
        }
        
    }
    
    func updateDataSource(){
        let dataTable = self.newsViewModel.newsData.articles
        dataNews = dataTable
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.selectionStyle = .none
        cell.viewContainer.layer.cornerRadius = 5
        cell.viewContainer.layer.shadowColor = UIColor.lightGray.cgColor
        cell.viewContainer.layer.shadowOpacity = 1
        cell.viewContainer.layer.shadowRadius = 5
        cell.viewContainer.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.lblTitle.text = dataNews[indexPath.row].title
        cell.lblDate.text = dataNews[indexPath.row].publishedAt
        cell.lblSource.text = dataNews[indexPath.row].source.name
        cell.imNews.layer.cornerRadius = 5
        cell.imNews.clipsToBounds = true
        
        cell.imNews.kf.indicatorType = .activity
        cell.imNews.kf.setImage(with: URL(string: dataNews[indexPath.row].urlToImage), placeholder: nil, options: nil)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationDetailNews = segue.destination as! DetailViewController
        let title = dataNews[tableView.indexPathForSelectedRow!.row].title
        let content = dataNews[tableView.indexPathForSelectedRow!.row].content
        let date = dataNews[tableView.indexPathForSelectedRow!.row].publishedAt
        let url = dataNews[tableView.indexPathForSelectedRow!.row].url
        let urlToImage = dataNews[tableView.indexPathForSelectedRow!.row].urlToImage
        let media = dataNews[tableView.indexPathForSelectedRow!.row].source.name
        
        
        destinationDetailNews.titleData = title
        destinationDetailNews.contentData = content
        destinationDetailNews.dateData = date
        destinationDetailNews.urlData = url
        destinationDetailNews.urlToImageData = urlToImage
        destinationDetailNews.mediaData = media
    }
}



