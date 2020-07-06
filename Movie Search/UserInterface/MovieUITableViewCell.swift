//
//  MovieUITableViewCell.swift
//  Movie Search
//
//  Created by Maglly on 7/2/20.
//  Copyright © 2020 Maglly. All rights reserved.
//

import UIKit

class MovieUITableViewCell: UITableViewCell {
    
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var movieTitlelabel: UILabel!
    @IBOutlet var movieYearlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier = "MovieTableViewCell"
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        }
    
    func configure(model:Movie) {
        
        self.movieTitlelabel.text = model.Title
        self.movieYearlabel.text = model.Year
        
        let url = model.Poster
        if let data = try? Data(contentsOf:URL(string: url)!) {
            self.moviePosterImageView.image = UIImage(data: data)
        }
    }
    
    
}
