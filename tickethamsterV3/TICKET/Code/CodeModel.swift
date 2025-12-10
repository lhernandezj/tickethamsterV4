//
//  CodeModel.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import Foundation

struct Codee: Identifiable, Equatable {
    
    let id = UUID()
    
    var tx1: String
    var tx2: String
    var tx3: String
    var tx4: String
    var tx5: String
    
    var imageUrl: String
    var tag: Int
    
    static var sampleCode = Codee(tx1: "Boleto Normal", tx2: "General Admission", tx3: "GNP-09", tx4: "32", tx5: "8", imageUrl: "barcodeA", tag: 0)
    
    static var sampleCodes : [Codee] = [
        
        Codee(tx1: "Boleto Normal", tx2: "General Admission", tx3: "GNP-09", tx4: "32", tx5: "8", imageUrl: "barcodeA", tag: 0),
        Codee(tx1: "Boleto Normal", tx2: "General Admission", tx3: "GNP-09", tx4: "32", tx5: "9", imageUrl: "barcodeA", tag: 1),
        
        ]
 
}
