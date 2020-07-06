//
//  MoviesViewModel.swift
//  Movie Search
//
//  Created by Maglly on 7/6/20.
//  Copyright © 2020 Maglly. All rights reserved.
//

import Foundation

class MoviesViewModel  {
    
     var movies = [Movie]()
    
    
    
    func getUrl(indexPath:IndexPath) -> String {
        
        let url = "https://www.imdb.com/title/\(self.movies[indexPath.row].imdbID)"
        
        return url

    }

    
    
}

