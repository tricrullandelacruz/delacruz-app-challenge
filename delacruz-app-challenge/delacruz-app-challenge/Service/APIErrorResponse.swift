//
//  APIErrorResponse.swift
//  ShareInvestor
//
//  Created by Tric Rullan on 9/24/20.
//  Copyright © 2020 ShareInvestor. All rights reserved.
//

import Foundation

struct APIErrorResponse: Decodable {
  var code = 0
  var message: String?
}
