//
//  File.swift
//  NetworkCoreLayer
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation

public protocol NetworkServiceProtocol: Sendable {

    func request(
        _ request: APIRequest
    ) async throws -> Data
}
