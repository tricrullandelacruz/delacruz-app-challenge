//
//  MoviesWebServiceType.swift
//  delacruz-app-challenge
//
//  Created by Tricia Lorrainne Dela Cruz on 4/20/22.
//

import Foundation

protocol MoviesWebServiceType {
  
  func list(parameter: MovieListParameter,
            success: RequestSuccessClosure<MovieListResponse>?,
            failure: RequestFailureClosure?)
  
}

struct MoviesWebService: MoviesWebServiceType {
  
  private let service: WebService<MoviesAPI>
  
  init(service: WebService<MoviesAPI> = .init()) {
    self.service = service
  }
  
  func list(parameter: MovieListParameter,
            success: RequestSuccessClosure<MovieListResponse>?,
            failure: RequestFailureClosure?) {
    service.requestObject(path: .movieList(parameter: parameter),
                          success: success,
                          failure: failure)
  }
  
}
