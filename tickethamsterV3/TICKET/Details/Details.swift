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
    
    let page: Page
    
    var body: some View {
        
        ZStack {
            List {
                VStack(alignment: .leading){
                    Text("Seat Location").bold()
                    Text(page.seatDetail) // ✅ SeatDetail
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text(page.tx6).bold() // ✅ Name
                    Text(page.tx7)        // ✅ Date
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
                    Text(page.barcodeNumber) // ✅ BarcodeNumber
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text(page.place).bold()   // ✅ Place
                    Text(page.city)           // ✅ City
                        .font(.system(size: 15))
                        .padding(.vertical, 0.5)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Order Number").bold()
                    // Si luego quieres otro campo para order number real, lo agregamos.
                    Text(page.purchase)
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Ticket Type").bold()
                    Text(page.tx1) // ✅ Type
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Entrance").bold()
                    Text(page.acceso) // ✅ Acceso
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Purchase Date").bold()
                    Text(page.purchase) // ✅ Purchase
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Ticket Price").bold()
                    
                    Text(priceLine(label: "Ticket Face Value", value: page.price)) // ✅
                        .font(.system(size: 15))
                        .padding(.vertical, 0.1)
                        .opacity(0.5)
                    
                    Text(priceLine(label: "GRAND TOTAL", value: page.price)) // ✅
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
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Color("nHead")
                        .frame(width: 600, height: 105)
                        .background(.ultraThinMaterial)
                        .blur(radius: 0.5)
                        .edgesIgnoringSafeArea(.top)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                ZStack{
                    Image(systemName: "multiply")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .padding(.trailing, 350)
                     
                    Text("Ticket Details")
                        .fontWeight(.medium)
                        .bold()
                        .font(.custom("Lexend", size: 18))
                        .foregroundColor(.white)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        //ENDS HEAD
    }
    
    private func priceLine(label: String, value: String) -> String {
        // Ajusta estos espacios a tu gusto para que se parezca a tu formato
        let spaces = String(repeating: " ", count: max(1, 55 - label.count))
        return "\(label)\(spaces)\(value)"
    }
}

#Preview {
    Details(page: Page.samplePage)
}
