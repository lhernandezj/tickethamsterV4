//
//  PageModel.swift
//  tickethamsterV3
//

import Foundation

struct Page: Identifiable, Equatable {
    
    let id = UUID()
    
    // MARK: - Campos del ticket
    var tx1: String   // Type
    var tx2: String   // Header "SEC ROW SEAT" o similar
    var tx3: String   // Sec
    var tx4: String   // Row
    var tx5: String   // Seat
    var tx6: String   // Name
    var tx7: String   // Date
    var tx8: String   // "Mobile Entry"
    var tx9: String   // "View in Wallet"
    
    /// URL de la imagen del ticket (campo imageUrl en Firestore)
    var imageUrl: String
    
    /// URL del código de barras (campo Barcode en Firestore)
    var barcodeUrl: String
    
    /// URL del fondo safe (campo SafeIMG en Firestore)
    var safeUrl: String
    
    /// Texto de acceso (campo Acceso en Firestore)
    var acceso: String
    
    /// Índice/tag para TabView
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
        self.tag = tag
    }
    
    // MARK: - Init manual / sample
    init(tx1: String,
         tx2: String,
         tx3: String,
         tx4: String,
         tx5: String,
         tx6: String,
         tx7: String,
         tx8: String,
         tx9: String,
         imageUrl: String,
         barcodeUrl: String,
         safeUrl: String,
         acceso: String,
         tag: Int) {
        
        self.tx1 = tx1
        self.tx2 = tx2
        self.tx3 = tx3
        self.tx4 = tx4
        self.tx5 = tx5
        self.tx6 = tx6
        self.tx7 = tx7
        self.tx8 = tx8
        self.tx9 = tx9
        self.imageUrl = imageUrl
        self.barcodeUrl = barcodeUrl
        self.safeUrl = safeUrl
        self.acceso = acceso
        self.tag = tag
    }
    
    // MARK: - Sample data
    static var samplePage = Page(
        tx1: "Boleto Normal",
        tx2: "SEC     ROW     SEAT",
        tx3: "GNP-09",
        tx4: "32",
        tx5: "8",
        tx6: "BAD BUNNY - DeBÍ TiRAR MáS FOToS WORLD TOUR",
        tx7: "Wed 10 Dic 2025 • Estadio GNP Seguros",
        tx8: "Mobile Entry",
        tx9: "View in Wallet",
        imageUrl: "ticket",
        barcodeUrl: "",
        safeUrl: "safe",
        acceso: "ACCESO B",
        tag: 0
    )
    
    static var samplePages: [Page] = [
        Page(
            tx1: "Boleto Normal",
            tx2: "SEC     ROW     SEAT",
            tx3: "GNP-09",
            tx4: "32",
            tx5: "8",
            tx6: "BAD BUNNY - DeBÍ TiRAR MáS FOToS WORLD TOUR",
            tx7: "Wed 10 Dic 2025 • Estadio GNP Seguros",
            tx8: "Mobile Entry",
            tx9: "View in Wallet",
            imageUrl: "ticket",
            barcodeUrl: "",
            safeUrl: "safe",
            acceso: "ACCESO B",
            tag: 0
        ),
        Page(
            tx1: "Boleto Normal",
            tx2: "General Admission",
            tx3: "GNP-09",
            tx4: "32",
            tx5: "9",
            tx6: "BAD BUNNY - DeBÍ TiRAR MáS FOToS WORLD TOUR",
            tx7: "Wed 10 Dic 2025 • Estadio GNP Seguros",
            tx8: "Mobile Entry",
            tx9: "View in Wallet",
            imageUrl: "ticket",
            barcodeUrl: "",
            safeUrl: "safe",
            acceso: "ACCESO C",
            tag: 1
        ),
    ]
}
