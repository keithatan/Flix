//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Keith Tan on 1/23/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    var movie: [String:Any]!

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var moviePosterView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rating = movie["vote_average"] as! Double

 
        
        titleLabel.text = movie["title"] as? String
        titleLabel.textAlignment = .center

        synopsisLabel.text = movie["overview"] as? String
        ratingLabel.text = "Score: \(rating)/10"

        let release = movie["release_date"] as! String
        let endOfYear = release.index(of: "-")!
        let year = release[..<endOfYear]
        
        releaseYearLabel.text = "(\(year))"
        
        titleLabel.sizeToFit()
        synopsisLabel.sizeToFit()
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterpath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterpath)
        
        moviePosterView.af_setImage(withURL: posterURL!)
        
        let higherResURL = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: higherResURL + backdropPath)
        backdropView.af_setImage(withURL: backdropURL!)
        
        let  gradientLayer   = CAGradientLayer()
        gradientLayer.frame  =  self.backdropView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        self.backdropView.layer.addSublayer(gradientLayer)
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
