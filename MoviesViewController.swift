//
//  MoviesViewController.swift
//  Flix
//
//  Created by Neha Swamy on 10/13/19.
//  Copyright © 2019 Neha Swamy. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var movies: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveMovies()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 250
        tableView.updateConstraints()
    }
    
    private func retrieveMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.movies = dataDictionary["results"] as! [[String: Any]]
                self.tableView.reloadData()
                print("Made call")
            }
        }
        task.resume()
    }
}
extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell
        
        let movie = self.movies[indexPath.row]
        let title = movie["title"] as? String
        let description = movie["overview"] as? String
        
        cell.titleLabel.text = title
        cell.synopsisLabel.text = description
        
        if let posterPath = movie["poster_path"] as? String {
            let posterBaseUrl = "http://image.tmdb.org/t/p/w500"
            let posterUrl = URL(string: posterBaseUrl + posterPath)
            cell.posterView.af_setImage(withURL: posterUrl!)
            
        } else {
            cell.posterView.image = nil
        }
        return cell
    }
}
