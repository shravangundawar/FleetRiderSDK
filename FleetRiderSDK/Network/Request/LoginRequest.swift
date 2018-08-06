//
//  AuthenticationRequest.swift
//  Swift-CodeFlow
//
 

import Foundation
import Alamofire

enum LoginRequestEndpoint {
  case login(String, [String: Any]?)
}

class LoginRequest: BackendAPIRequest {
    
    var endpoint: LoginRequestEndpoint
    
    init(endpoint: LoginRequestEndpoint) {
        self.endpoint = endpoint
    }
    
    var path: String {
        switch endpoint {
        case .login(_,_):
            return Network.API.login
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch endpoint {
        case .login(_,_):
            return .post
        }
    }
    
    var parameters: [String : Any]? {
      var params = defaultParameters()
      
      switch endpoint {
      case .login(_,let requestData):
        if let data = requestData {
          params = data
        }
      }
      return params
    }
    
  var headers: [String : String]? {
    var headers = defaultHeaders()
    
    switch endpoint {
    case .login(let authorization,_):
      headers[DictKey.authorization] = authorization
    }
    return headers
  }
    
    var queryType: NetworkService.QueryType {
        return .none
    }
    
}
