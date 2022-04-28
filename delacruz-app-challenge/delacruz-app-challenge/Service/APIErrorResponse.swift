//
//  APIErrorResponse.swift
//
//
//  Created by Tric Rullan on 9/24/20.
// 
//

import Foundation

struct APIErrorResponse: Decodable {
  var code = 0
  var message: String?
}
