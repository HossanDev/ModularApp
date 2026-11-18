//
//  File.swift
//  NetworkCoreLayer
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation

public enum NetworkError: Error, Sendable {
  case invalidURL
  case invalidResponse
  case unacceptableStatusCode(Int)
  case requestFailed(String)
}

extension NetworkError: LocalizedError {
  
  public var errorDescription: String? {
    switch self {
    case .invalidURL:
      return "The request URL is invalid."
      
    case .invalidResponse:
      return "The server returned an invalid response."
      
    case .unacceptableStatusCode(let statusCode):
      return "HTTP error: \(statusCode)."
      
    case .requestFailed(let message):
      return message
    }
  }
}
