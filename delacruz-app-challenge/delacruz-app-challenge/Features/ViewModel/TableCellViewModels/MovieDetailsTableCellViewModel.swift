//
//  MovieDetailsTableCellViewModel.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

protocol MovieDetailsTableCellViewModelType {
  
  var title: String { get }
  var year: String { get }
  var imageURL: String { get }
  var genre: String { get }
  var runtime: String { get }
  var rated: String { get }
  var subDetails: String { get }
  
}

struct MovieDetailsTableCellViewModel: MovieDetailsTableCellViewModelType {
  
  init(movie: MovieDetailsResponse) {
    self.movie = movie
  }
  
  var title: String {
    return movie.title
  }
  
  var subDetails: String {
    return "\(movie.year)"
  }
  
  var year: String {
    return movie.year
  }
  
  var imageURL: String {
    return movie.poster
  }
  
  var genre: String {
    return movie.genre
  }
  
  var runtime: String {
    return movie.runtime
  }
  
  var rated: String {
    return movie.rated
  }
  
  private var movie: MovieDetailsResponse
}
