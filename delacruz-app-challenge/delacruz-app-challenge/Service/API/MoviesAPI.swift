//
//  MoviesAPI.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Moya

enum MoviesAPI {
  case list(parameter: MovieListParameter)
  case details(parameter: MovieDetailsParameter)
}

extension MoviesAPI: TargetType {
  
  var baseURL: URL {
    URL(string: API.baseURL)!
  }
  
  var path: String {
    switch self {
    case .list, .details:
      return ""
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .list, .details:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .list, .details:
      return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .list, .details:
      return nil
    }
  }
  
  private var parameters: [String: Any] {
    switch self {
    case let .list(parameter):
      return (try? parameter.asDictionary()) ?? [:]
    case let .details(parameter):
      return (try? parameter.asDictionary()) ?? [:]
    }
  }
  
}
