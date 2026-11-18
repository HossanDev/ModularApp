//
//  UserViewModel.swift
//  SmartApp
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation
import Observation
import NetworkLayer

@MainActor
@Observable
final class UserViewModel {
  
  private(set) var users: [APIUser] = []
  private(set) var isLoading = false
  private(set) var errorMessage: String?
  
  private let repository: any UserRepositoryProtocol
  
  init(repository: any UserRepositoryProtocol) {
    self.repository = repository
  }
  
  func fetchUsers() async {
    
    isLoading = true
    errorMessage = nil
    
    defer {
      isLoading = false
    }
    
    do {
      users = try await repository.fetchUsers()
    } catch {
      errorMessage = error.localizedDescription
    }
  }
}
