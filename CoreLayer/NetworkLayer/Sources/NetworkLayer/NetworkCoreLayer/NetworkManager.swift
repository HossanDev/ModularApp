//
//  File.swift
//  NetworkCoreLayer
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation

public actor NetworkManager: NetworkServiceProtocol {
  
  // MARK: - Properties
  private let configuration: NetworkConfiguration
  private let session: URLSession
  
  // MARK: - Initializer
  public init(
    configuration: NetworkConfiguration,
    session: URLSession? = nil
  ) {
    self.configuration = configuration
    
    if let session {
      self.session = session
    } else {
      let sessionConfiguration = URLSessionConfiguration.default
      
      sessionConfiguration.timeoutIntervalForRequest =
      configuration.timeoutInterval
      
      sessionConfiguration.timeoutIntervalForResource = 60
      
      sessionConfiguration.urlCache = URLCache(
        memoryCapacity: 20 * 1024 * 1024,
        diskCapacity: 100 * 1024 * 1024,
        diskPath: "NetworkCache"
      )
      
      sessionConfiguration.requestCachePolicy =
        .useProtocolCachePolicy
      
      self.session = URLSession(
        configuration: sessionConfiguration
      )
    }
  }
  
  // MARK: - Request
  
  public func request(
    _ request: APIRequest
  ) async throws -> Data {
    
    let urlRequest = try buildRequest(request)
    
    do {
      let (data, response) = try await session.data(
        for: urlRequest
      )
      
      guard let httpResponse = response as? HTTPURLResponse else {
        throw NetworkError.invalidResponse
      }
      
      guard (200...299).contains(httpResponse.statusCode) else {
        throw NetworkError.unacceptableStatusCode(
          httpResponse.statusCode
        )
      }
      
      return data
      
    } catch let error as NetworkError {
      throw error
      
    } catch is CancellationError {
      throw CancellationError()
      
    } catch {
      throw NetworkError.requestFailed(
        error.localizedDescription
      )
    }
  }
  
  // MARK: - Build Request
  private func buildRequest(
    _ request: APIRequest
  ) throws -> URLRequest {
    
    let path = request.path.trimmingCharacters(
      in: CharacterSet(charactersIn: "/")
    )
    
    let url = configuration.baseURL.appending(
      path: path
    )
    
    guard var components = URLComponents(
      url: url,
      resolvingAgainstBaseURL: false
    ) else {
      throw NetworkError.invalidURL
    }
    
    if !request.queryParameters.isEmpty {
      components.queryItems = request.queryParameters
        .sorted { $0.key < $1.key }
        .map {
          URLQueryItem(
            name: $0.key,
            value: $0.value
          )
        }
    }
    
    guard let finalURL = components.url else {
      throw NetworkError.invalidURL
    }
    
    var urlRequest = URLRequest(
      url: finalURL,
      cachePolicy: request.method == .get
      ? .useProtocolCachePolicy
      : .reloadIgnoringLocalCacheData,
      timeoutInterval: configuration.timeoutInterval
    )
    
    urlRequest.httpMethod = request.method.rawValue
    urlRequest.httpBody = request.body
    
    // Default headers
    for (key, value) in configuration.defaultHeaders {
      urlRequest.setValue(value, forHTTPHeaderField: key)
    }
    
    // Request-specific headers override defaults
    for (key, value) in request.headers {
      urlRequest.setValue(value, forHTTPHeaderField: key)
    }
    
    return urlRequest
  }
}
