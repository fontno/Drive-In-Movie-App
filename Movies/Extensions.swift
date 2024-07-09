//
//  Extensions.swift
//  Movies
//
//  Created by Brian Fontenot on 12/8/22.
//

import Foundation
import SwiftUI

extension Color {
    static var mode = Color("Mode")
}
// TODO:
extension Date {
    func formatText() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: self)
    }
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: self)
    }
    
    func formatTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        
        return dateFormatter.string(from: self)
    }
}


extension Int {
    func toDollars() -> Int {
        return self / 100
    }
    
    func toCents() -> Int {
        return self * 100
    }
    
    func format() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(integerLiteral: self))!
    }
}
