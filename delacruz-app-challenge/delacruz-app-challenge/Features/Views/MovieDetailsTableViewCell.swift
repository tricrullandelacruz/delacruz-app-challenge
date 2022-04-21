//
//  MovieDetailsTableViewCell.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
  @IBOutlet weak private var imagePosterView: UIImageView!
  @IBOutlet weak private var titleLabel: UILabel!
  @IBOutlet weak private var subDetailsLabel: UILabel!
  @IBOutlet weak private var ratingLabel: UILabel!
  @IBOutlet weak private var ratingContainerView: UIView!
  
  var viewModel: MovieDetailsTableCellViewModelType!
  
  override func awakeFromNib() {
    super.awakeFromNib()

    configureViews()
  }
}

private extension MovieDetailsTableViewCell {
  func configureViews() {
    ratingContainerView.addBorder(edges: .all, color: .gray)
    ratingContainerView.roundCorners(.allCorners, radius: 3)
  }
}

extension MovieDetailsTableViewCell: BindableType, MovieSectionItemModelBindableType {
  
  func bindViewModel() {
    
    titleLabel.text = viewModel.title.uppercased()
    ratingLabel.text = viewModel.rated
    subDetailsLabel.text = "\(viewModel.subDetails)"
    
    if let url = URL(string: viewModel.imageURL) {
      imagePosterView.load(url: url)
    } else {
      imagePosterView.image = R.image.photoPlaceholder()
    }
  }
  
}
