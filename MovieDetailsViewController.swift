//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Neha Swamy on 10/20/19.
//  Copyright © 2019 Neha Swamy. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    var movie: [String: Any]!
    @IBOutlet var backdrop: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var synopsis: UITextView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    
    @IBOutlet var moviePoster: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsis.text = movie["overview"] as? String
        synopsis.sizeToFit()
        synopsis.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        synopsis.isScrollEnabled = true
        synopsis.isUserInteractionEnabled = true
        synopsis.showsVerticalScrollIndicator = true
       
        let posterBaseUrl = "http://image.tmdb.org/t/p/w500"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: posterBaseUrl + posterPath)
        moviePoster.af_setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "http://image.tmdb.org/t/p/w780" + backdropPath)
        backdrop.af_setImage(withURL: backdropUrl!)
        
        let rating:String = String(format: "%@", movie["vote_average"] as! CVarArg)
        
        ratingLabel.text = "Rating: " + rating
        
        let releaseDate:String = String(format: "%@", movie["release_date"] as! CVarArg)
        
        releaseDateLabel.text = "Release date: " + releaseDate
    }
}
 

