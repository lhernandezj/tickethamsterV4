//
//  PageModel.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import Foundation

struct Page: Identifiable, Equatable {
    
    let id = UUID()
    
    // MARK: - Campos del ticket (UI existente)
    var tx1: String   // Type
    var tx2: String   // Header "SEC ROW SEAT"
    var tx3: String   // Sec
    var tx4: String   // Row
    var tx5: String   // Seat
    var tx6: String   // Name
    var tx7: String   // Date
    var tx8: String   // fijo "Mobile Entry"
    var tx9: String   // fijo "View in Wallet"
    
    // MARK: - Imágenes / URLs
    var imageUrl: String     // Firestore: imageUrl
    var barcodeUrl: String   // Firestore: Barcode (URL de imagen)
    var safeUrl: String      // Firestore: SafeIMG (URL de imagen)
    
    // MARK: - CodeView
    var acceso: String       // Firestore: Acceso
    
    // MARK: - Details (campos nuevos)
    var seatDetail: String       // Firestore: SeatDetail
    var barcodeNumber: String    // Firestore: BarcodeNumber
    var place: String            // Firestore: Place
    var city: String             // Firestore: City
    var purchase: String         // Firestore: Purchase
    var price: String            // Firestore: Price
    
    // MARK: - TabView
    var tag: Int
    
    // MARK: - Init desde Firebase
    init(type: String,
         sec: String,
         row: String,
         seat: String,
         name: String,
         date: String,
         imageUrl: String,
         barcodeUrl: String,
         safeUrl: String,
         acceso: String,
         seatDetail: String,
         barcodeNumber: String,
         place: String,
         city: String,
         purchase: String,
         price: String,
         tag: Int,
         headerText: String = "SEC     ROW     SEAT") {
        
        self.tx1 = type
        self.tx2 = headerText
        self.tx3 = sec
        self.tx4 = row
        self.tx5 = seat
        self.tx6 = name
        self.tx7 = date
        self.tx8 = "Mobile Entry"
        self.tx9 = "View in Wallet"
        
        self.imageUrl = imageUrl
        self.barcodeUrl = barcodeUrl
        self.safeUrl = safeUrl
        
        self.acceso = acceso
        
        self.seatDetail = seatDetail
        self.barcodeNumber = barcodeNumber
        self.place = place
        self.city = city
        self.purchase = purchase
        self.price = price
        
        self.tag = tag
    }
    
    // MARK: - Sample (para previews)
    static var samplePage = Page(
        type: "Boleto Normal",
        sec: "GNP-09",
        row: "32",
        seat: "8",
        name: "BAD BUNNY - DeBÍ TiRAR MáS FOToS WORLD TOUR",
        date: "Wed 10 Dic 2025 • 9:00 PM",
        imageUrl: "https://example.com/ticket.png",
        barcodeUrl: "https://example.com/barcode.png",
        safeUrl: "https://example.com/safe.png",
        acceso: "ACCESO B",
        seatDetail: "GNP-09 / 32 / 8",
        barcodeNumber: "323322837072082138c",
        place: "Estadio GNP Seguros",
        city: "Ciudad de México DF MX",
        purchase: "Mon, May 5 2025",
        price: "$4741.00",
        tag: 0
    )
    
    static var samplePages: [Page] = [
        samplePage
    ]
}
