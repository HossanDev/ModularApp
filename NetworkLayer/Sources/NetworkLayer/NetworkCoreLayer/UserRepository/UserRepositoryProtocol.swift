//
//  File.swift
//  NetworkCoreLayer
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation

public protocol UserRepositoryProtocol: Sendable {
    func fetchUsers() async throws -> [APIUser]
}
