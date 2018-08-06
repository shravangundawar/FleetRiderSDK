//
//  LoginNetworkManager.swift
//  Fleet
//
 

import Foundation
import Alamofire

public class LoginNetworkManager {
  
  static let shared = LoginNetworkManager()
  
  public init() {}
    
  public class func loginUser(authorization: String, requestData: [String: Any], completion: @escaping (Any?) -> Void, failuer: @escaping (Error?) -> Void, networkFailuer: () -> Void?) {
    
    LoginOperation.shared.loginUsers(authorization: authorization, requestData: requestData, completion: { (response) in
      completion(response)
    }, failuer: { (error) in
      failuer(error)
    }) { () -> Void? in
      networkFailuer()
    }
    
    
  }
}
