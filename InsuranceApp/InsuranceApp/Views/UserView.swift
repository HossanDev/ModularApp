//
//  UserView.swift
//  SmartApp
//
//  Created by MohammadHossan on 18/11/2026.
//


import SwiftUI
import NetworkLayer
import SharedUI

struct UserView: View {
  
  @State private var viewModel: UserViewModel
  
  init(repository: UserRepositoryProtocol) {
    _viewModel = State(
      initialValue: UserViewModel(
        repository: repository
      )
    )
  }
  
  var body: some View {
    NavigationStack {
      Group {
        if viewModel.isLoading {
          ProgressView("Loading users...")
          
        } else if let error = viewModel.errorMessage {
          VStack(spacing: 12) {
            Text(error)
            
            DKButton("Retry") {
              Task {
                await viewModel.fetchUsers()
              }
            }
          }
          
        } else {
          List(viewModel.users) { user in
            VStack(alignment: .leading, spacing: 6) {
              Text(user.name)
                .font(.headline)
              
              Text(user.email)
                .font(.subheadline)
                .foregroundStyle(.secondary)
              
              Text(user.phone)
                .font(.subheadline)
                .foregroundStyle(.secondary)
              
              Text(user.username)
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
          }
        }
      }
      .navigationTitle("Users")
    }
    .task {
      await viewModel.fetchUsers()
    }
  }
}

// MARK: - Preview
#Preview("User List") {
  UserView(
    repository: MockUserRepository()
  )
}
