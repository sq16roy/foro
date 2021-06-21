//
//  Articulo.swift
//  ListaDeCompras
//
//  Created by Roy Solera on 6/17/21.
//

import Foundation

struct Comment: Codable {
    var postId: Int
    var name: String
    var id: Int
    var email: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case postId
        case name
        case id
        case email
        case body
    }
}

