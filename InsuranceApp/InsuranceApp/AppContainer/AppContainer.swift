//
//  AppContainer.swift
//  SmartApp
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation
import NetworkLayer

@MainActor
final class AppContainer {
  
  let networkService:  NetworkServiceProtocol
  let userRepository: UserRepositoryProtocol
  
  init(configuration: NetworkConfiguration) {
    
    let networkService = NetworkManager(
      configuration: configuration
    )
    
    self.networkService = networkService
    
    self.userRepository = UserRepository(
      networkService: networkService
    )
  }
}
