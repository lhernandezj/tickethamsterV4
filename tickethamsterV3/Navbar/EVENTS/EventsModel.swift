//
//  EventsModel.swift
//  Ticketmaster4
//
//  Created by Eduardo Jimenez on 10/12/25.
//

import Foundation

struct EventModel: Identifiable {
    var id: String = UUID().uuidString
    var nombre: String
    var lugar: String
    var fecha: String
    var eventIMG: String 
}
