//
//  NetworkService.swift
//  Swift-CodeFlow
//
 

import Foundation
import Alamofire
//import SwiftyJSON

class NetworkService {
    
    // MARK: - Private
    
    private let host = Bundle.main.apiEndpointUrl!
    
    // MARK: - Enums
    
    enum QueryType {
        case none
        case queryString
        case httpBody
    }
    
    // MARK: - Public
 
    func makeRequest(for path: String, method: Alamofire.HTTPMethod,
                     queryType: QueryType, params: [String: Any]? = nil, headers: [String: String]? = nil,
                     completion: @escaping (Any?) -> Void,
                     failuer: @escaping (Error) -> Void) {
//        DPrint("request in network service...")
        var urlRequest = query(path, params: params, queryType: queryType)
        urlRequest.httpMethod = method.rawValue
//        if method == .post {
            urlRequest.allHTTPHeaderFields = headers
//        }

        NetworkLog(params!)
        NetworkLog(headers!)

      
        
        Alamofire.request(urlRequest.url!, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { (response) in

                switch response.result {
                case .success:
                    completion(response.result.value)
                    break

                case .failure:
                    failuer(response.result.error!)
                    break
                }
        }

    }
    
    func query(_ path: String, params: [String: Any]?, queryType: QueryType) -> URLRequest {
        let url = URL(string: host.appending(path))!
        var urlRequest: URLRequest?
        
        switch queryType {
        case .httpBody:
            urlRequest = URLRequest(url: url)
            if let params = params, !params.isEmpty {
                urlRequest?.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
            }
        case .queryString:
            if let params = params, !params.isEmpty {
                var query = ""
                params.forEach { key, value in
                    query = query + "\(key)=\(value)&"
                }
                
                var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
                components.query = query
                urlRequest = URLRequest(url: components.url!)
            }
        case .none:
            urlRequest = URLRequest(url: url)
        }
        
        urlRequest?.timeoutInterval = 60//BackendConfiguration.timeout!
        return urlRequest!
    }

    
}

