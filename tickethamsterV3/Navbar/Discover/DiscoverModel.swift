//
//  DiscoverModel.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import Foundation

struct Event: Identifiable, Equatable {
    let id: String          // Firestore documentID ("1", "2", "3"...)
    var tx1: String         // Lugar
    var tx2: String         // Nombre
    var img1: String        // EventoUrl
    var fecha: String       // Fecha
}

