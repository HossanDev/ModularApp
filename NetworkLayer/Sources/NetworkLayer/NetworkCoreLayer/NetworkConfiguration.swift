//
//  File.swift
//  NetworkCoreLayer
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation

public struct NetworkConfiguration: Sendable {

    public let baseURL: URL
    public let timeoutInterval: TimeInterval
    public let defaultHeaders: [String: String]

    public init(
        baseURL: URL,
        timeoutInterval: TimeInterval = 30,
        defaultHeaders: [String: String] = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
    ) {
        self.baseURL = baseURL
        self.timeoutInterval = timeoutInterval
        self.defaultHeaders = defaultHeaders
    }
}
