//
//  MovieDetailsParameter.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

struct MovieDetailsParameter: Encodable {
  let apikey = API.apiKey
  let i: String
}
