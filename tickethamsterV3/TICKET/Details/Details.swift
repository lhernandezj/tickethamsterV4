//
//  Details.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct Details: View {
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

        ZStack{

            List {
  
                VStack(alignment: .leading){
                    Text("Seat Location").bold()
                    Text("GNP-09 / 32 / 8")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("BAD BUNNY - DeBÍ TiRAR MáS FOToS WORD...").bold()
                    Text("WED 10 Dic 2025 • Estadio GNP Seguros")
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
                    Text("323322837072082138c")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Estadio GNP Seguros").bold()
                    Text("Ciudad de México DF MX")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Order Number").bold()
                    Text("43-53522/MXC")
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
                    Text("ACCESO B")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Purchase Date").bold()
                    Text("Mon, May 5 2025")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Ticket Price").bold()
                    Text("Ticket Face Value                                                 $4741.00")
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                    Text("GRAND TOTAL                                                      $4741.00")
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
    Details()
}
