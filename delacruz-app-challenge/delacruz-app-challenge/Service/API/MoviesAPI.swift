//
//  MoviesAPI.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Moya

enum MoviesAPI {
  case movieList(parameter: MovieListParameter)
}

extension MoviesAPI: TargetType {
  
  var baseURL: URL {
    URL(string: API.baseURL)!
  }
  
  var path: String {
    switch self {
    case .movieList:
      return ""
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .movieList:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .movieList:
      return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .movieList:
      return nil
    }
  }
  
  private var parameters: [String: Any] {
    switch self {
    case let .movieList(parameter):
      return (try? parameter.asDictionary()) ?? [:]
    }
  }
  
}
