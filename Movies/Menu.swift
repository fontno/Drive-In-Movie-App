//
//  Menu.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import Foundation

struct Menu: Codable, Identifiable {
    var id: UUID
    
    static func all() -> [MenuItem] {
        let items = [MenuItem(id: UUID(), name: "Popcorn", price: 400, image: "maiken-ingvordsen-Bz-eN8FoVPE-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Hot Dog", price: 600, image: "jessica-loaiza-glqTtszXfM0-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Nachos", price: 500, image: "erick-su-WjBp05j8LXI-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Banana Split", price: 600, image: "molly-keesling-7YhrOw6Kngo-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Skittles", price: 300, image: "karsten-winegeart-EI-iNlUGfzI-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Starbursts", price: 300, image: "taylor-rooney-dFC80hmTOoE-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "jelly beans", price: 300, image: "amit-lahav-3t07n27XK-w-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Soda", price: 200, image: "edge2edge-media-0KxfiWujzyY-unsplash", imageExtension: "jpg")]
        
        return items
    }
    static func featured() -> [MenuItem] {
        let items = [MenuItem(id: UUID(), name: "Popcorn", price: 400, image: "maiken-ingvordsen-Bz-eN8FoVPE-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Hot Dog", price: 600, image: "jessica-loaiza-glqTtszXfM0-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Nachos", price: 500, image: "erick-su-WjBp05j8LXI-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Banana Split", price: 600, image: "molly-keesling-7YhrOw6Kngo-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Skittles", price: 300, image: "karsten-winegeart-EI-iNlUGfzI-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Starbursts", price: 300, image: "taylor-rooney-dFC80hmTOoE-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "jelly beans", price: 300, image: "amit-lahav-3t07n27XK-w-unsplash", imageExtension: "jpg"),
                     MenuItem(id: UUID(), name: "Soda", price: 200, image: "edge2edge-media-0KxfiWujzyY-unsplash", imageExtension: "jpg")]
        
        return items
    }
    
}
