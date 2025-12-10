//
//  PageModel.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import Foundation

struct Page: Identifiable, Equatable {
    
    let id = UUID()
    
    // MARK: - Campos visibles en el ticket
    
    /// Type (viene de Firestore: "Type")
    var tx1: String
    
    /// Texto de header de la línea de asientos (puede ser "SEC     ROW     SEAT" o "General Admission")
    var tx2: String
    
    /// Sec (viene de Firestore: "Sec")
    var tx3: String
    
    /// Row (viene de Firestore: "Row")
    var tx4: String
    
    /// Seat (viene de Firestore: "Seat")
    var tx5: String
    
    /// Nombre del evento (viene de Firestore: "Name")
    var tx6: String
    
    /// Fecha / info del evento (viene de Firestore: "Date")
    var tx7: String
    
    /// Texto fijo: "Mobile Entry"
    var tx8: String
    
    /// Texto fijo: "View in Wallet"
    var tx9: String
    
    /// Imagen del ticket (viene de Firestore: "TicketIMG" como URL)
    var imageUrl: String
    
    /// Índice/tag para el TabView
    var tag: Int
    
    // MARK: - Init conveniente para datos que vienen de Firebase
    
    /// Inicializador pensado para construir un Page desde los campos de Firestore
    init(type: String,
         sec: String,
         row: String,
         seat: String,
         name: String,
         date: String,
         ticketIMG: String,
         tag: Int,
         headerText: String = "") {
        
        self.tx1 = type                // Type
        self.tx2 = headerText          // "SEC     ROW     SEAT" o "General Admission"
        self.tx3 = sec                 // Sec
        self.tx4 = row                 // Row
        self.tx5 = seat                // Seat
        self.tx6 = name                // Name
        self.tx7 = date                // Date
        self.tx8 = "Mobile Entry"      // fijo
        self.tx9 = "View in Wallet"    // fijo
        self.imageUrl = ticketIMG      // URL de la imagen
        self.tag = tag
    }
    
    // MARK: - Inits originales para sample data (para que nada se rompa)
    
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
        self.tag = tag
    }
    
    // MARK: - Datos de ejemplo
    
    static var samplePage = Page(
        tx1: "Boleto Normal",
        tx2: "",
        tx3: "Seccion",
        tx4: "Fila",
        tx5: "Asiento",
        tx6: "Nombre",
        tx7: "Fecha • Estadio GNP Seguros",
        tx8: "Mobile Entry",
        tx9: "View in Wallet",
        imageUrl: "ticket",
        tag: 0
    )
    
    static var samplePages: [Page] = [
        Page(
            tx1: "Boleto Normal",
            tx2: "",
            tx3: "Seccion",
            tx4: "Fila",
            tx5: "Asiento",
            tx6: "Nombre",
            tx7: "Fecha • Estadio GNP Seguros",
            tx8: "Mobile Entry",
            tx9: "View in Wallet",
            imageUrl: "ticket",
            tag: 0
        ),
        Page(
            tx1: "Boleto Normal",
            tx2: "",
            tx3: "Seccion",
            tx4: "Fila",
            tx5: "Asiento",
            tx6: "Nombre",
            tx7: "Fecha • Estadio GNP Seguros",
            tx8: "Mobile Entry",
            tx9: "View in Wallet",
            imageUrl: "ticket",
            tag: 1
        ),
    ]
}
