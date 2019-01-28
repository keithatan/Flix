//
//  SearchViewController.swift
//  Flix
//
//  Created by Keith Tan on 1/27/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    

    @IBOutlet weak var searchTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchTable.dataSource = self
        searchTable.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let keywords = searchBar.text
        let query = keywords?.replacingOccurrences(of: " ", with: "%20")
        
        
        
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&query=\(query ?? "")&page=1&include_adult=true")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                print(self.movies)
                
                self.searchTable.reloadData()
                
            }
        }
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        
        let movie = movies[indexPath.row]
        
        let title = movie["title"] as! String
        
        cell.titleLabel.text = title
        
        return cell
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
