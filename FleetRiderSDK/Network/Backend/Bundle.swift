//
//  Bundle.swift
//  Swift-CodeFlow
//
 

import Foundation

extension Bundle {
    
    var apiEndpointUrl: String? {
        return Bundle.main.infoDictionary?["APIEndpointUrl"] as? String
    }
    
    var appVersion: String? {
        return "1.0"//infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildNumber: String? {
        return "1.0"//infoDictionary?["CFBundleVersion"] as? String
    }
    
}
