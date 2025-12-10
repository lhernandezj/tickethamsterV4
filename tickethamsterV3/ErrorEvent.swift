//
//  ErrorEvent.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct ErrorEvent: View {
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {ZStack{
        ZStack{
            
            Color.white
            
            
            ZStack(){
                
                ZStack{
                    
                    Text("Sorry, we could't find the event you're looking for.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 70)
                        .font(.system(size: 18))
                    
                    
                    Text(.init("Visit www.ticketmaster.com.mx to complete your purchase."))
                        .accentColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top, 170)
                        .padding(.horizontal, 80)
                        .font(.system(size: 18))
                    
                }
                .opacity(0.8)
                .padding(.bottom, 65)
            }
        }
    }
            
    //STARTS HEAD
    .overlay {
        
        
        ZStack{
            
            //ESTE BOTON CIERRA EL MODAL
            Button(action: {presentationMode.wrappedValue.dismiss()}){
                
                
                
                Color("nHead")
                    .frame(height: 105)
                    .background(.ultraThinMaterial)
                    .blur(radius: 0.5)
                    .edgesIgnoringSafeArea(.top)
            }
            .frame(maxHeight: .infinity,alignment: .top)
            ZStack{
                
                Image(systemName: "multiply")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20))
                    .padding(.trailing, 350)
                
                
                Text("Event Details")
                    .fontWeight(.medium)
                    .bold()
                    .font(.custom("Lexend", size: 18))
                    .foregroundColor(Color.white)
                
                
            }
            .frame(maxHeight: .infinity,alignment: .top)
        }
    }
    .frame(maxHeight: .infinity,alignment: .top)
    //ENDS HEAD
}
}

#Preview {
    ErrorEvent()
}
