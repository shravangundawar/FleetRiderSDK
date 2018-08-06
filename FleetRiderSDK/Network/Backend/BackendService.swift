//
//  BackendService.swift
//  Swift-CodeFlow
//
 

import Foundation
import Alamofire
//import SwiftyJSON

class BackendService {
    
    // MARK: - Local Variables
    
    fileprivate let service = NetworkService()
    
    // MARK: - Public
    func sendRequest(_ request: BackendAPIRequest, completion: @escaping (Any?) -> Void, failuer: @escaping (Error) -> Void) {
        service.makeRequest(for: request.path, method: request.method,
                            queryType: request.queryType, params: request.parameters,
                            headers: request.headers, completion: { (json) in
            completion(json)
        }) { (error) in
            failuer(error)
        }
    }

}
