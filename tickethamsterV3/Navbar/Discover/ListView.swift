//
//  ListView.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI

struct ListView: View {
    
    @State private var eventIndex = 0
    private let events: [Event] = Event.samplePages

    var body: some View {

            ZStack{
                
        
                
                ZStack{
                    TabView(selection: $eventIndex) {
                        ForEach(events) { event in
                            VStack{
                                DiscoverView(event: event)                            }
                            .tag(event.tag)
                            
                        }
                    }
                    .navigationBarHidden(true).navigationBarTitle("")
                }
                
                
            }
    }
}

#Preview {
    ListView()
}
