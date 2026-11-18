//
//  File.swift
//  NetworkCoreLayer
//
//  Created by MohammadHossan on 18/11/2026.
//

import Foundation

public struct APIUser: Decodable, Sendable, Identifiable {

    public let id: Int
    public let name: String
    public let username: String
    public let email: String
    public let phone: String
    public let website: String
}
