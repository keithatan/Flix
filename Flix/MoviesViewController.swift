//
//  MoviesViewController.swift
//  Flix
//
//  Created by Keith Tan on 1/14/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var movieResponse = [[String:Any]]()
    var movies = [Movie]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                self.movieResponse = dataDictionary["results"] as! [[String:Any]]
            
                /*Need to look over this code if I want to use movie objects*/
                
                /*
                for i in 0..<self.movieResponse.count{
                    self.movies[i] = Movie(vote_count: movieResponse["vote_count"] as? Int, id:movieResponse["id"] as? Int, video:movieResponse["video"] as? Bool, vote_average:movieResponse["vote_average"] as? Double, title:movieResponse["title"] as! String, popularity:movieResponse["popularity"] as? Double, poster_path:movieResponse["poster_path"] as! String, original_language:movieResponse["original_language"] as! String, original_title:movieResponse["original_title"] as! String, genre_ids: <#[Int]#>, backdrop_path:movieResponse["backdrop_path"] as! String, adult:movieResponse["adult"] as? Bool, overview:movieResponse["overview"] as! String, release_date:movieResponse["release_date"] as! String);
                }
                */
 
                
                self.tableView.reloadData();
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
    
        
        let movie = movieResponse[indexPath.row]
        let title = movie["title"] as! String
        let rating = movie["vote_average"] as! Double
        let synopsis = movie["overview"] as! String
        
        cell.titleLabel.text = title
        cell.ratingLabel.text = "Score: \(rating)/10"
        cell.synopsisLabel.text = synopsis
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterpath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterpath)
        
        cell.moviePoster.af_setImage(withURL: posterURL!)
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
