//
//  MenuItem.swift
//  Movies
//
//  Created by Brian Fontenot on 8/24/23.
//

import SwiftUI

struct MenuItem: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var price: Int
    var image: String
    var imageExtension: String
    var quantity: Int = 0
    
    func formattedCurrency(_ amount: Int) -> String {
//        return amount.formatted(.currency(code: Locale.current.currencyCode ?? "USD"))
        return amount.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD"))
    }
    
    func poster() -> UIImage {
        
        let file = Bundle.main.path(forResource: image, ofType: imageExtension)!
        return UIImage(contentsOfFile: file)!
    }
}
