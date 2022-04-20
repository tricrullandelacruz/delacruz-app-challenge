//
//  MovieListParameter.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

struct MovieListParameter: Encodable {
  let apikey = API.apiKey
  let s: String = "Marvel"
  let type: String = "movie"
  let page: Int
}
