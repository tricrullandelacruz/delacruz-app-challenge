//
//  WebService.swift
//  ShareInvestor
//
//  Created by Tric Rullan on 9/24/20.
//  Copyright © 2020 ShareInvestor. All rights reserved.
//

import Moya

typealias RequestSuccessClosure<T> = (_ result: T?) -> ()
typealias RequestSuccessClosures<T, String> = (_ result: T?, _ result: String?) -> ()
typealias RequestFailureClosure = (_ error: WebServiceError?) -> ()

protocol WebServiceType {
  
  associatedtype Provider
  func requestObject<T: Decodable>(path: Provider, success: RequestSuccessClosure<T>?, failure: RequestFailureClosure?)
  func requestObject(path: Provider, success: RequestSuccessClosure<Data>?, failure: RequestFailureClosure?)
}

struct WebService<U: TargetType>: WebServiceType {

  private let provider: MoyaProvider<U>
  
  init(provider: MoyaProvider<U> = MoyaProvider<U>()) {
    self.provider = provider
  }
  
  func requestObject<T: Decodable>(path: U, success: RequestSuccessClosure<T>?, failure: RequestFailureClosure?) {
    self.provider.request(path) { result in
      switch result {
      case let .success(response):
        print("URL: \(response.request?.url)")
        print("HTTP BODY: \(response.request?.httpBody)")
        do {
          let jsonResponse = try? JSONSerialization.jsonObject(with: response.data, options: [])
          print(jsonResponse)
                    
          guard let status = response.response?.allHeaderFields["Status"] as? String,
            status == "401 Unauthorized" else {
              let object = try JSONDecoder().decode(T.self, from: response.data)
              success?(object)
              return
          }

          failure?(WebServiceError.expiredAuthorization)

        } catch {
          do {
            let object = try JSONDecoder().decode(APIErrorResponse.self, from: response.data)
            // print(response.response?.allHeaderFields["Status"])
            failure?(WebServiceError.api(object))
          } catch {
            failure?(WebServiceError.mapping)
          }
        }
      case let .failure(error):
        failure?(WebServiceError.moya(error))
      }
    }
  }
  
  func requestObject(path: U, success: RequestSuccessClosure<Data>?, failure: RequestFailureClosure?) {
    self.provider.request(path) { result in
      switch result {
      case let .success(response):
        do {
          let jsonResponse = try? JSONSerialization.jsonObject(with: response.data, options: [])
          // print(jsonResponse)
          
          guard let status = response.response?.allHeaderFields["Status"] as? String,
                status == "401 Unauthorized" else {
            success?(response.data)
            return
          }
          
          failure?(WebServiceError.expiredAuthorization)
          
        } catch {
          do {
            let object = try JSONDecoder().decode(APIErrorResponse.self, from: response.data)
            
            // print(response.response?.allHeaderFields["Status"])
            failure?(WebServiceError.api(object))
          } catch {
            failure?(WebServiceError.mapping)
          }
        }
      case let .failure(error):
        failure?(WebServiceError.moya(error))
      }
    }
  }
}
