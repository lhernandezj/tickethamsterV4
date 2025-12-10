//
//  DiscoverModel.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import Foundation

struct Event: Identifiable, Equatable {
    
    let id = UUID()
    
    var tx1: String
    var tx2: String
  
    var img1: String
    var tag: Int
    
    
    static var samplePage = Event(tx1: "Venue Name", tx2: "Event Name", img1: "default", tag: 0)
    
    static var samplePages : [Event] = [
        Event(tx1: "Venue 1", tx2: "Event Name 1", img1: "default", tag: 0),
        
        Event(tx1: "Venue 2", tx2: "Event Name 2", img1: "default", tag: 1),
    ]
   
}
