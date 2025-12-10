//
//  Venues.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct Venues: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        
        VStack{
            
            Image("venues")
                .resizable()
                .frame(width: 300, height: 269)
            
          
                
                Text("Find Your Favorites")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                
                Text("Get alerts when events are here.")
                    .font(.system(size: 14))
                    .padding()
                
                Button(action: {isPresented = true}){
                    
                    ZStack{
                        
                        Rectangle()
                            .frame(width: 350, height: 45)
                            .background(Color("blueticket"))
                        
                        Text("Add Favorite Venues")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }
                }
                .alert(isPresented: $isPresented, content: {
                                            Alert(title: Text("Error"),
                                                  message: Text("A network error has occurred, please try again later."),
                                                  dismissButton: Alert.Button.default(Text("Accept"), action: {
                                                print("El user ha pulsado el botón de Aceptar")
                                            }))
                                        })
                .padding(.top, 80)
            
        }
    }
}


#Preview {
    Venues()
}
