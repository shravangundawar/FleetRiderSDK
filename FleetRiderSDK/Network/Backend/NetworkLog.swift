//
//  NetworkLog.swift
//  Swift-CodeFlow
//
 

import UIKit

func NetworkLog<T>(_ object: @autoclosure () -> T) {
    #if DEBUG
        print(String(reflecting: object()) + "\n")
    #endif
}
