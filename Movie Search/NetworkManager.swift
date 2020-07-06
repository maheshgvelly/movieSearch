//
//  NetworkManager.swift
//  Movie Search
//
//  Created by Maglly on 7/6/20.
//  Copyright © 2020 Maglly. All rights reserved.
//

import Foundation


final class NetworkManager {
    
    private init() {}
    
    static let shared = NetworkManager()
    
    typealias callBack = (_ response: MovieResult?, _ error: Error?) -> Void
    
    
    
    func callMovieApi (searchQuery:String, callBackResponse: @escaping callBack) {
        //URL Session
        let url = "https://www.omdbapi.com/?apikey=d069fd2d&s=\(searchQuery)&type=movie"
        URLSession.shared.dataTask(with: URL(string: url)!,
                                   completionHandler: { data, response, error in
                                    
                                    
                                    guard let data = data, error == nil else {
                                        return
                                    }
                                    //convert into swift objects
                                    var result:MovieResult?
                                    do {
                                        result =  try  JSONDecoder().decode(MovieResult.self, from: data)
                                    }
                                    catch {
                                        print("Error")
                                    }
                                    guard let finalResult = result else {
                                        return
                                    }
                                    
                                   callBackResponse(finalResult, nil)
                                    
        }).resume()
    }
    
    
}
