//
//  File.swift
//  NetworkCoreLayer
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation

public struct MockUserRepository: UserRepositoryProtocol {
  
  public init() {}
  
  public var mockUser =  APIUser(
    id: 1,
    name: "John Smith",
    username: "johnsmith",
    email: "john@example.com",
    phone: "123-456-789",
    website: "johnsmith.com"
  )
  
  public var mockSarahUser =  APIUser(
    id: 2,
    name: "Sarah Johnson",
    username: "sarahjohnson",
    email: "sarah@example.com",
    phone: "987-654-321",
    website: "sarahjohnson.com"
  )
  
  public var mockBrownUser =  APIUser(
    id: 3,
    name: "Michael Brown",
    username: "michaelbrown",
    email: "michael@example.com",
    phone: "456-789-123",
    website: "michaelbrown.com"
  )
  
  public func fetchUsers() async throws -> [APIUser] {
   return  [mockUser, mockSarahUser, mockBrownUser, mockUser]
  }
}
