//
//  InsuranceAppApp.swift
//  InsuranceApp
//
//  Created by MohammadHossan on 18/11/2026.
//

import SwiftUI
import NetworkLayer

@main
struct InsuranceAppApp: App {
  private let container: AppContainer

  init() {
      let configuration = NetworkConfiguration(
          baseURL: URL(
              string: "https://jsonplaceholder.typicode.com"
          ) ?? URL(filePath: "/")
      )

      container = AppContainer(
          configuration: configuration
      )
  }

  var body: some Scene {
      WindowGroup {
          UserView(
              repository: container.userRepository
          )
      }
  }
}

