//
//  MovieListCollectionCellViewModel.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

protocol MovieListCollectionCellViewModelType {
  var imageURL: String { get }
  var title: String { get }
}

struct MovieListCollectionCellViewModel: MovieListCollectionCellViewModelType {
  
  init(movie: SearchResponse,
       index: Int) {
    self.movie = movie
    self.index = index
  }
  
  var index: Int
  var movie: SearchResponse
  var title: String {
    return movie.title
  }
  
  var imageURL: String {
    return movie.poster
  }
}
