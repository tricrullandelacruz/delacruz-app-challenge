//
//  MovieDetailsResponse.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

struct MovieDetailsResponse {
  let title: String
  let year: String
  let rated: String
  let released: String
  let runtime: String
  let genre: String
  let director: String
  let writer: String
  let actors: String
  let plot: String
  let language: String
  let country: String
  let awards: String
  let poster: String
  let ratings: [MovieDetailsRatingsResponse]?
  let metascore: String
  let imdbRating: String
  let imdbID: String
  let imdbVotes: String
  let type: String
  let dvd: String
  let boxOffice: String
  let production: String
  let website: String
  let response: String
}

extension MovieDetailsResponse: Decodable {
  enum MovieDetailsCodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case rated = "Rated"
    case released = "Released"
    case runtime = "Runtime"
    case genre = "Genre"
    case director = "Director"
    case writer = "Writer"
    case actors = "Actors"
    case plot = "Plot"
    case language = "Language"
    case country = "Country"
    case awards = "Awards"
    case poster = "Poster"
    case ratings = "Ratings"
    case metascore = "Metascore"
    case imdbRating
    case imdbID
    case imdbVotes
    case type = "Type"
    case dvd = "DVD"
    case boxOffice = "BoxOffice"
    case production = "Production"
    case website = "Website"
    case response = "Response"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieDetailsCodingKeys.self)
    title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
    year = try container.decodeIfPresent(String.self, forKey: .year) ?? ""
    rated = try container.decodeIfPresent(String.self, forKey: .rated) ?? ""
    released = try container.decodeIfPresent(String.self, forKey: .released) ?? ""
    runtime = try container.decodeIfPresent(String.self, forKey: .runtime) ?? ""
    genre = try container.decodeIfPresent(String.self, forKey: .genre) ?? ""
    director = try container.decodeIfPresent(String.self, forKey: .director) ?? ""
    writer = try container.decodeIfPresent(String.self, forKey: .writer) ?? ""
    actors = try container.decodeIfPresent(String.self, forKey: .actors) ?? ""
    plot = try container.decodeIfPresent(String.self, forKey: .plot) ?? ""
    language = try container.decodeIfPresent(String.self, forKey: .language) ?? ""
    country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
    awards = try container.decodeIfPresent(String.self, forKey: .awards) ?? ""
    poster = try container.decodeIfPresent(String.self, forKey: .poster) ?? ""
    ratings = try container.decodeIfPresent([MovieDetailsRatingsResponse].self, forKey: .ratings)
    metascore = try container.decodeIfPresent(String.self, forKey: .metascore) ?? ""
    imdbRating = try container.decodeIfPresent(String.self, forKey: .imdbRating) ?? ""
    imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID) ?? ""
    imdbVotes = try container.decodeIfPresent(String.self, forKey: .imdbVotes) ?? ""
    type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    dvd = try container.decodeIfPresent(String.self, forKey: .dvd) ?? ""
    boxOffice = try container.decodeIfPresent(String.self, forKey: .boxOffice) ?? ""
    production = try container.decodeIfPresent(String.self, forKey: .production) ?? ""
    website = try container.decodeIfPresent(String.self, forKey: .website) ?? ""
    response = try container.decodeIfPresent(String.self, forKey: .response) ?? ""
  }
  
}

struct MovieDetailsRatingsResponse {
  let source: String
  let value: String
}

extension MovieDetailsRatingsResponse: Decodable {
  enum MovieDetailsRatingCodingKeys: String, CodingKey {
    case source = "Source"
    case value = "Value"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieDetailsRatingCodingKeys.self)
    source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
    value = try container.decodeIfPresent(String.self, forKey: .value) ?? ""
  }
}
