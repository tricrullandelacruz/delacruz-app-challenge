//
//  MovieListCollectionCellViewModel.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

protocol MovieListCollectionCellViewModelType {
  var imageURL: String { get }
}

struct MovieListCollectionCellViewModel: MovieListCollectionCellViewModelType {
  
  init(movie: SearchResponse) {
    print(movie)
    self.movie = movie
  }
  
  var movie: SearchResponse
  
  var imageURL: String {
    return movie.poster
  }
}
