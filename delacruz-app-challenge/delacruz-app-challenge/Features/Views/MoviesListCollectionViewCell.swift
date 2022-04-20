//
//  MoviesListCollectionViewCell.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import UIKit
import Alamofire

class MoviesListCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak private var imageView: UIImageView!
  
  var viewModel: MovieListCollectionCellViewModelType!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
}

extension MoviesListCollectionViewCell: BindableType, MovieSectionItemModelBindableType {
  
  func bindViewModel() {
    
    if let url = URL(string: viewModel.imageURL) {
      imageView.load(url: url)
    }
 
  }
  
}
