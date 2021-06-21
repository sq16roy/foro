//
//  Articulo.swift
//  ListaDeCompras
//
//  Created by Roy Solera on 6/17/21.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var title: String
    var id: Int
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case title
        case id
        case body
    }
}

