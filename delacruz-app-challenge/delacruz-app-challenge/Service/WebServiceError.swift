//
//  WebServiceError.swift
//  ShareInvestor
//
//  Created by Tric Rullan on 9/24/20.
//  Copyright © 2020 ShareInvestor. All rights reserved.
//

import Moya
import Alamofire

enum WebServiceError: Error {
  case api(APIErrorResponse)
  case moya(MoyaError)
  case mapping
  case expiredAuthorization
}

extension WebServiceError: LocalizedError {

  var code: Int {
    switch self {
    case let .api(error):
      return error.code
    case let .moya(error):
      switch error {
      case let .underlying(afError as AFError, _):
        return (afError.underlyingError as NSError?)?.code ?? -10000
      default:
        return error.response?.statusCode ?? -10000
      }
    case .mapping:
      return -10001
    case .expiredAuthorization:
      return 401
    }
  }

  var errorDescription: String? {
    switch self {
    case let .api(error):
      return error.message
    case let .moya(error):
      switch error {
       case let .underlying(afError as AFError, _):
        let code = (afError.underlyingError as NSError?)?.code ?? -10000
        if code == NSURLErrorNotConnectedToInternet {
          return "No Internet Connection. Please try again."
        } else {
          return "There seems to be a problem connecting to CNX for Home’s server. Please try again."
        }
       default:
         return error.errorDescription
       }
    case .expiredAuthorization:
      return "Authorization is expired. Please login again."
    default:
      return "Failed to map data to JSON."
    }
  }

}
