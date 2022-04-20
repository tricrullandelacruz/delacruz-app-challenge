//
//  MovieListResponse.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

struct MovieListResponse {
  let search: [SearchResponse]?
}

extension MovieListResponse: Decodable {
  enum MovieListCodingKeys: String, CodingKey {
    case search = "Search"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieListCodingKeys.self)
    search = try container.decode([SearchResponse].self, forKey: .search)
  }

}

struct SearchResponse {
  let title: String
  let year: String
  let imdbID: String
  let type: String
  let poster: String
}

extension SearchResponse: Decodable {
  enum SearchCodingKeys: String, CodingKey {
    case title = "Title"
    case year = "Year"
    case imdbID
    case type = "Type"
    case poster = "Poster"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: SearchCodingKeys.self)
    title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
    year = try container.decodeIfPresent(String.self, forKey: .year) ?? ""
    imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID) ?? ""
    type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    poster = try container.decodeIfPresent(String.self, forKey: .poster) ?? ""
  }

}

