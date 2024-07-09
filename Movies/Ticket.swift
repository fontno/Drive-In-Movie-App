//
//  Ticket.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import Foundation
import SwiftUI

struct Ticket: Codable, Identifiable, Hashable {
    static func == (lhs: Ticket, rhs: Ticket) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(row)
    }
    let id: UUID
    let row: Int
    let seat: Int
    let date: Date
    var sold: Bool = false
    let movie: Movie
    var price: Int = 4000
    
    var poster: UIImage {
        let file = Bundle.main.path(forResource: movie.poster, ofType: movie.posterExtension)!
        return UIImage(contentsOfFile: file)!
    }
    
    // Last 16 characters of uuid string
    var barcodeString: String {
        id.uuidString.dropFirst(id.uuidString.count - 12).uppercased()
    }
    
    static func all() -> [Ticket] {
        var tickets: [Ticket] = []
        for rowIndex in (0...5) {
            for seatIndex in (0...7) {
                tickets.append(Ticket(id: UUID(), row: rowIndex, seat: seatIndex, date: Date(), movie: Movie.all().first!))
            }
        }
        return tickets
    }
    
    static func random() -> [Ticket] {
        var tickets: [Ticket] = []
        for rowIndex in (0...5) {
            for seatIndex in (0...7) {
                let evenRow: Bool = (rowIndex % 2) == 0
                let evenSeat: Bool = (seatIndex % 2) == 0
                let sold = evenRow && evenSeat
                tickets.append(Ticket(id: UUID(), row: rowIndex, seat: seatIndex, date: Date(), sold: sold, movie: Movie.all().first!))
            }
        }
        return tickets
    }
    
    static func examples() -> [Ticket] {
        return [Ticket(id: UUID(), row: 4, seat: 5, date: Date(), movie: Movie.all()[0]),
                Ticket(id: UUID(), row: 3, seat: 4, date: Date(), movie: Movie.all()[1]),
                Ticket(id: UUID(), row: 2, seat: 3, date: Date(), movie: Movie.all()[2])]

    }
}
