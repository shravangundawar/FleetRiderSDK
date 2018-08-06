//
//  UserOperation.swift
//  Swift-CodeFlow
//
 

import Foundation
//import SwiftyJSON

class LoginOperation: BackendService {
    
    // MARK: - Public Properties
    
    static let shared = LoginOperation()
    
    // MARK: - Private Properties
    
    private var request: LoginRequest?
    
//    // MARK: - Callbacks
//
//    var completion: ((Any?) -> Void)?
//    var failure: ((Error) -> Void)?
  
    // MARK: - API Calls
    
  func loginUsers(authorization: String, requestData: [String: Any], completion: @escaping (Any?) -> Void, failuer: @escaping (Error?) -> Void, networkFailuer: () -> Void?) {
      if true {
        request = LoginRequest(endpoint: .login(authorization, requestData))
        sendRequest(request!, completion: { (response) in
          completion(response!)
        }) { (error) in
          failuer(error)
        }
      } else {
        networkFailuer()
      }
    }
    
    // MARK: - Private
    
//    private func dispatch() {
//        if let request = request {
//            sendRequest(request, completion: handleSuccess(_:), failuer: handleFailure(_:))
//        }
//    }
//
//    private func handleSuccess(_ json: Any?) {
//        completion?(json)
//    }
//
//    private func handleFailure(_ error: Error) {
//        failure?(error)
//    }
  
}
