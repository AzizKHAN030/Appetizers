//
//  NetworkError.swift
//  Appetizers
//
//  Created by Azizbek  Rasulov on 11/01/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
