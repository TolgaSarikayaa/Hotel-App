//
//  RoomType.swift
//  Hotel App
//
//  Created by Tolga Sarikaya on 13.01.23.
//

import Foundation

// MARK: - Properties
struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    // MARK: - Functions
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
    
    static var all: [RoomType] {
        return [
            RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
            RoomType(id: 1, name: "One King", shortName: "K", price: 209),
            RoomType(id: 2, name: "suit", shortName: "S", price: 159),
        ]
    }
}
