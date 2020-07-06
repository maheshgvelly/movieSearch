//
//  ViewController.swift
//  Movie Search
//
//  Created by Maglly on 7/2/20.
//  Copyright © 2020 Maglly. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var searchField: UITextField!
    @IBOutlet var movieTableView: UITableView!
    
    var viewModel: MoviesViewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        self.searchField.delegate = self
        
    }
    
    //Search Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //SearchMovies
        self.searchMovies()
        return true
    }
    
    
    //Search Movies Funcion
    func searchMovies() {
        
        self.searchField.resignFirstResponder()
        
        guard let text = searchField.text, !text.isEmpty else{
            return
        }
        let searchQuery = text.replacingOccurrences(of: " ", with: "%20")
        
        viewModel.movies.removeAll()
        
        
        NetworkManager.shared.callMovieApi(searchQuery: searchQuery) { (result, error) in
            //Update the Movies Array
            let newMovies = result?.Search
            self.viewModel.movies.append(contentsOf: newMovies!)
            
            //Reload the table view
                  DispatchQueue.main.async {
                      self.movieTableView.reloadData()
                  }
        }
    }
    
    
    //Table views
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieUITableViewCell
        
        cell.configure(model: viewModel.movies[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        movieTableView.deselectRow(at: indexPath, animated: true)
        //Show Movie Detail page
        //let url = "https://www.imdb.com/title/\(viewModel.movies[indexPath.row].imdbID)"
        
        let vc = SFSafariViewController(url: URL(string: viewModel.getUrl(indexPath: indexPath))!)
        present(vc, animated: true)
    }
    
}





