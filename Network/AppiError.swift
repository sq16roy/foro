//
//  ApiError.swift
//  PlaylistReader
//
//  Created by Roy Solera on 6/17/21.
//

import Foundation

enum ApiError: Error {
    case requestFailed(description: String)
    case jsonConversionFailure(description: String)
    case invalidData
    case responseUnsuccessful(description: String)
    case jsonParsingFailure
    case noInternet
    case failedSerialization
}
