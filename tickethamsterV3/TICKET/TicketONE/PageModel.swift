//
//  PageModel.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import Foundation

struct Page: Identifiable, Equatable {
    
    let id = UUID()
    
    var tx1: String
    var tx2: String
    
    var tx3: String
    var tx4: String
    var tx5: String
    
    var tx6: String
    var tx7: String
    
    var tx8: String
    var tx9: String
    
    var imageUrl: String
    var tag: Int
    
    
    static var samplePage = Page(tx1: "Boleto Normal", tx2: "SEC     ROW     SEAT", tx3: "GNP-09", tx4: "32", tx5: "8", tx6: "BAD BUNNY - DeBÍ TiRAR MáS FOToS WORLD TOUR", tx7: "Wed 10 Dic 2025 • Estadio GNP Seguros", tx8: "Mobile Entry", tx9: "View in Wallet", imageUrl: "ticket", tag: 0)
    
    static var samplePages : [Page] = [
        Page(tx1: "Boleto Normal", tx2: "SEC     ROW     SEAT", tx3: "GNP-09", tx4: "32", tx5: "8", tx6: "BAD BUNNY - DeBÍ TiRAR MáS FOToS WORLD TOUR", tx7: "Wed 10 Dic 2025 • Estadio GNP Seguros", tx8: "Mobile Entry", tx9: "View in Wallet", imageUrl: "ticket", tag: 0),
        
        Page(tx1: "Boleto Normal", tx2: "General Admission", tx3: "GNP-09", tx4: "32", tx5: "9", tx6: "BAD BUNNY - DeBÍ TiRAR MáS FOToS WORLD TOUR", tx7: "Wed 10 Dic 2025 • Estadio GNP Seguros", tx8: "Mobile Entry", tx9: "View in Wallet", imageUrl: "ticket", tag: 1),
    ]
   
}
