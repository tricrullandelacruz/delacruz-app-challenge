//
//  MovieDetailsInfoTableViewCell.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import UIKit

class MovieDetailsInfoTableViewCell: UITableViewCell {
  
  var viewModel: MovieDetailsInfoTableCellViewModelType!
  
  @IBOutlet weak private var genreLabel: UILabel!
  @IBOutlet weak private var runtimeLabel: UILabel!
  @IBOutlet weak private var ratingLabel: UILabel!
  @IBOutlet weak private var synopsisValueLabel: UILabel!
  
  @IBOutlet weak private var scoreValueLabel: UILabel!
  @IBOutlet weak private var reviewsValueLabel: UILabel!
  @IBOutlet weak private var popularityLabel: UILabel!
  
  @IBOutlet weak private var directorValueLabel: UILabel!
  @IBOutlet weak private var writerValueLabel: UILabel!
  @IBOutlet weak private var actorsValueLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
}

extension MovieDetailsInfoTableViewCell: BindableType, MovieSectionItemModelBindableType {
  
  func bindViewModel() {
    
    genreLabel.text = viewModel.genre
    runtimeLabel.text = viewModel.runtime
    ratingLabel.text = viewModel.rating
    synopsisValueLabel.text = viewModel.synopsis
    scoreValueLabel.text = viewModel.score
    reviewsValueLabel.text = viewModel.reviews
    popularityLabel.text = viewModel.popularity
    directorValueLabel.text = viewModel.director
    writerValueLabel.text = viewModel.writer
    actorsValueLabel.text = viewModel.actors
  }
  
}

