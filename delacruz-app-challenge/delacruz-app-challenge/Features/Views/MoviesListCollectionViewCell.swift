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
  @IBOutlet weak private var titleLabel: UILabel!
  
  var viewModel: MovieListCollectionCellViewModelType!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
}

extension MoviesListCollectionViewCell: BindableType, MovieSectionItemModelBindableType {
  
  func bindViewModel() {
    titleLabel.text = viewModel.title
    
    if let url = URL(string: viewModel.imageURL),
       let data = try? Data(contentsOf: url) {
      imageView.image = UIImage(data: data)// Error here
    } else {
      imageView.image = R.image.photoPlaceholder()
    }
 
  }
  
}
