//
//  BackendAPIRequest.swift
//  Swift-CodeFlow
//
 

import Foundation
import Alamofire

protocol BackendAPIRequest {
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var queryType: NetworkService.QueryType { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension BackendAPIRequest {
    
    func defaultHeaders() -> [String: String] {
        var headers = [String: String]()
        headers[DictKey.contentType] = DefaultValue.applicationJson
        return headers
    }
    
    func defaultParameters() -> [String: Any] {
        let params = [String: Any]()
        // Add default parameter if any.
        return params
    }
    
}
