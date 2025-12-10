//
//  DetailsTWO.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/02/25.
//

import SwiftUI

struct DetailsTWO: View {
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

        ZStack{

            List {
  
                VStack(alignment: .leading){
                    Text("Seat Location").bold()
                    Text("General Admission PLUS / G8 / -")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Electric Daisy Carnival 2025 Individual Citibanamex Plus").bold()
                    Text("22 feb 2025, 3p.m. • Autódromo Hermanos Rodríguez")
                        .font(.system(size: 13.5))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                    
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Entry Info").bold()
                    Text("Boleto Digital")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Barcode Number").bold()
                    Text("62684640096125")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Autódromo Hermanos Rodríguez").bold()
                    Text("México DF")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Order Number").bold()
                    Text("43-22950/MXC")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Ticket Type").bold()
                    Text("Boleto normal")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Entrance").bold()
                    Text("P 6 GRAL DE PIE")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Purchase Date").bold()
                    Text("Fri, Nov 15 2024 - 19:23")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Ticket Price").bold()
                    Text("Ticket Face Value                                                 $1250.00")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                    Text("GRAND TOTAL                                                      $1250.00")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
        }
        
        
        //STARTS HEAD
        .overlay {
  
            ZStack{
                
                //ESTE BOTON CIERRA EL MODAL
                Button(action: {presentationMode.wrappedValue.dismiss()}){
 
                    Color("nHead")
                        .frame(width: 600, height: 105)
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
                     
                    Text("Ticket Details")
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
    DetailsTWO()
}
