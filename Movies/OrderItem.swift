//
//  OrderItem.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import Foundation

struct OrderItem: Codable, Identifiable, Hashable {
    static func == (lhs: OrderItem, rhs: OrderItem) -> Bool {
        return lhs.menuItem.name == rhs.menuItem.name
    }
    
    var id: UUID = UUID()
    var quantity: Int = 0 {
        didSet {
            subtotal = menuItem.price * quantity
        }
    }
    var menuItem: MenuItem
    var subtotal: Int = 0
    
    static func all() -> [OrderItem] {
        return [OrderItem(quantity: 2, menuItem: MenuItem(id: UUID(), name: "Popcorn", price: 400, image: "maiken-ingvordsen-Bz-eN8FoVPE-unsplash", imageExtension: "jpg")),
                OrderItem(quantity: 2, menuItem: MenuItem(id: UUID(), name: "Popcorn", price: 400, image: "maiken-ingvordsen-Bz-eN8FoVPE-unsplash", imageExtension: "jpg")),
                OrderItem(quantity: 1, menuItem: MenuItem(id: UUID(), name: "Skittles", price: 300, image: "karsten-winegeart-EI-iNlUGfzI-unsplash", imageExtension: "jpg")),
                OrderItem(quantity: 3, menuItem: MenuItem(id: UUID(), name: "Soda", price: 200, image:  "edge2edge-media-0KxfiWujzyY-unsplash", imageExtension: "jpg")),
                OrderItem(quantity: 3, menuItem: MenuItem(id: UUID(), name: "Soda", price: 200, image:  "edge2edge-media-0KxfiWujzyY-unsplash", imageExtension: "jpg")),
                OrderItem(quantity: 3, menuItem: MenuItem(id: UUID(), name: "Soda", price: 200, image:  "edge2edge-media-0KxfiWujzyY-unsplash", imageExtension: "jpg"))]
    }
    
}
