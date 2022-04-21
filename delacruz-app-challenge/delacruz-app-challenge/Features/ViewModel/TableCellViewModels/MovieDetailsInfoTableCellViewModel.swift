//
//  MovieDetailsInfoTableCellViewModel.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

protocol MovieDetailsInfoTableCellViewModelType {
  
  var genre: String { get }
  var runtime: String { get }
  var rating: String { get }
  var synopsis: String { get }
  var score: String { get }
  var reviews: String { get }
  var popularity: String { get }
  var director: String { get }
  var writer: String { get }
  var actors: String { get }
  
}

struct MovieDetailsInfoTableCellViewModel: MovieDetailsInfoTableCellViewModelType {
  
  init(movie: MovieDetailsResponse) {
    self.movie = movie
  }
 
  
  var genre: String {
    return movie.genre
  }
  
  var runtime: String {
    return "• \(movie.runtime) •"
  }
  
  var rating: String {
    let rottenTomatoes = movie.ratings?.filter { $0.source.uppercased() == R.string.localizable.rottenTomatoes().uppercased() }.first
    
    guard let rottenTomatoes = rottenTomatoes else { return movie.ratings?.first?.value ?? R.string.localizable.nA() }
    return rottenTomatoes.value
  }
  
  var synopsis: String {
    return movie.plot
  }
  var score: String {
    return movie.imdbRating
  }
  
  var reviews: String {
    return movie.imdbVotes
  }
  
  var popularity: String {
    return "\(movie.metascore)"
  }
  
  var director: String {
    return movie.director
  }
  
  var writer: String {
    return movie.writer
  }
  
  var actors: String {
    return movie.actors
  }
  
  private var movie: MovieDetailsResponse
}
