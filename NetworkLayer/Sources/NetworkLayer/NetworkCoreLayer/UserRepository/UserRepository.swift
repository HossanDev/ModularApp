//
//  File.swift
//  NetworkCoreLayer
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation

public struct UserRepository: UserRepositoryProtocol {

    private let networkService: NetworkServiceProtocol

    public init(
        networkService: NetworkServiceProtocol
    ) {
        self.networkService = networkService
    }

    public func fetchUsers() async throws -> [APIUser] {

        let request = APIRequest(
            path: "/users",
            method: .get
        )

        let data = try await networkService.request(request)

        let users = try JSONDecoder().decode(
            [APIUser].self,
            from: data
        )

        return users
    }
}
