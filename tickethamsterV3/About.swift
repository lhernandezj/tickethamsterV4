//
//  About.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct About: View {
    var body: some View {
        Image(systemName: "bonjour")
            .font(.system(size: 25))
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding()
            .opacity(0.6)
        Text("made by")
            .opacity(0.5)
        Text("Development Team").bold()
            .font(.system(size: 18))
            .opacity(0.6)
            .padding()
        Text("Daniel Quintana")
            .font(.system(size: 18))
            .opacity(0.6)
        Text("Jacobo Muñez")
            .font(.system(size: 18))
            .opacity(0.6)
        Text("Carlos Chapira")
            .font(.system(size: 18))
            .opacity(0.6)
        Text("Guillermo Conde")
            .font(.system(size: 18))
            .opacity(0.6)
        Text("Mauricio Vázquez")
            .font(.system(size: 18))
            .opacity(0.6)
        Text("Fabian Garcia")
            .font(.system(size: 18))
            .opacity(0.6)
        
        
        Text("Design Team").bold()
            .font(.system(size: 18))
            .opacity(0.6)
            .padding()
        Text("Eduardo Jimenez")
            .font(.system(size: 18))
            .opacity(0.6)
        Text("Brenda Izquierdo")
            .font(.system(size: 18))
            .opacity(0.6)
        Text("Daniela Ozco")
            .font(.system(size: 18))
            .opacity(0.6)
        
        Text("Q&A Team").bold()
            .font(.system(size: 18))
            .opacity(0.6)
            .padding()
        Text("Fernando Hernandez")
            .font(.system(size: 18))
            .opacity(0.6)
        Text("Christopher Rios")
            .font(.system(size: 18))
            .opacity(0.6)
        Text("Jose Peralta")
            .font(.system(size: 18))
            .opacity(0.6)
        
        
    }
}

#Preview {
    About()
}
