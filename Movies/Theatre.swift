//
//  Theatre.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import Foundation

struct Theatre: Codable, Identifiable {
    let id: UUID
    let name: String
    var rowCount = 8
    var seatPerRowCount = 6
    
    var rowCountIndicies: Range<Int> {
        Range(uncheckedBounds: (lower: 0, upper: rowCount - 1))
    }
    
    var seatsPerRowCountIndicies: Range<Int> {
        Range(uncheckedBounds: (lower: 0, upper: seatPerRowCount - 1))
    }
    
    static func first() -> Theatre {
        Theatre(id: UUID(), name: "Parkland Drive In")
    }
}

struct TheatreSection: Codable, Identifiable {
    let id: UUID
    let rows: [TheatreRow]
}

struct TheatreRow: Codable, Identifiable {
    let id: UUID
    let items: [TheatreRowItem]
    
    var indicies: Range<Int> {
        let count = Range(uncheckedBounds: (items.startIndex, items.endIndex - 1))
        return count
    }
}

struct TheatreRowItem: Codable, Identifiable {
    let id: UUID
    let number: Int
}
