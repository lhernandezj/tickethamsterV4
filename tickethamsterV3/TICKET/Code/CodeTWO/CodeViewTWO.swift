//
//  CodeViewTWO.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/02/25.
//

import SwiftUI

struct CodeViewTWO: View {
    
    @State var modal = false
    @State var animation: Bool = false
    
    @State var isPresented: Bool = false
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    var codee : CodeeTwo
    
    var body: some View {
        
        ZStack(){
            
            Image("safe")
                .resizable()
                .frame(width: 440, height: 774)
            
            RoundedRectangle(cornerRadius: 15.0)
                .frame(width:310,height: 138)
                .padding(.bottom, 178)
                .foregroundColor(Color.white)
            
            //ACTIVA LA ANIMACION DE SCAN
                .onAppear(){
                    animation.toggle()
                }
            
            //DATA FROM MODEL:
            
            Text(codee.tx1)
                .padding(.bottom, 595)
                .foregroundColor(Color.white)
                .font(.system(size: 22))
            
            Text(codee.tx2)
                .padding(.bottom, 512)
                .foregroundColor(Color.white)
                .font(.system(size: 22))
            
            Text(codee.tx3)
                .padding(.bottom, 440)
                .foregroundColor(Color.white)
                .font(.system(size: 22))
                .padding(.trailing, 200)
            
            Text(codee.tx4)
                .padding(.bottom, 440)
                .foregroundColor(Color.white)
                .font(.system(size: 22))
            
            Text(codee.tx5)
                .padding(.bottom, 440)
                .foregroundColor(Color.white)
                .font(.system(size: 22))
                .padding(.leading, 200)
            
            Image("\(codee.imageUrl)")
                .resizable()
                .frame(width: 280, height: 68)
                .padding(.bottom, 216)
            
            
            
            Text("Boleto digital")
                .foregroundColor(Color.white)
                .font(.system(size: 16))
                .padding(.top, 25)

            Text("Screenshot's won't get you in.")
                .font(.system(size: 13))
                .padding(.bottom, 95)
                .foregroundColor(Color.black)
            
            Button(action: {}) {
                ZStack{
                    Rectangle()
                        .frame(width: 170, height: 45)
                        .foregroundColor(Color("blueticket"))
                        .cornerRadius(5.0)
                    
                    HStack{
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 22))
                        Text("View in Wallet")
                            .font(.system(size: 16))
                    }
                    .foregroundColor(Color.white)
                }
            }
            .padding(.top, 120)
        
            ZStack(alignment: .leading){
                
                Text("ENTRANCE")
                    .foregroundColor(Color.white)
                    .font(.system(size: 18))
                    .padding(.top, 210)
                
                Text("P6 GRAL DE PIE")
                    .multilineTextAlignment(.leading)
                
                    .foregroundColor(Color.white)
                    .font(.system(size: 12))
                    .padding(.top, 255)
            }
            
            .padding(.trailing, 300)
            
            ZStack{
                
                Button(action: {isPresented = true}){
                    Image(systemName: "arrow.clockwise").bold()
                        .foregroundColor(Color.black)
                        .font(.system(size: 20))
                        .padding(.leading, 250)
                        .padding(.bottom, 95)
                }
                .alert(isPresented: $isPresented, content: {
                    Alert(title: Text("Error"),
                          message: Text("A network error has occurred, please try again later."),
                          dismissButton: Alert.Button.default(Text("Accept"), action: {
                        print("El user ha pulsado el botón de Aceptar")
                    }))
                })
                
                
                Rectangle()
                    .frame(width: 12, height: 68)
                    .frame(maxWidth: 302, alignment: animation ? .trailing : .leading)
                    .foregroundColor(Color("blueticket"))
                    .opacity(0.6)
                    .padding(.bottom, 216)
                //.animation(.spring())
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true).delay(0.13))
                
                Rectangle()
                    .frame(width: 4, height: 90)
                    .frame(maxWidth: 295, alignment: animation ? .trailing : .leading)
                    .foregroundColor(Color("blueticket"))
                    .padding(.bottom, 216)
                //.animation(.spring())
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true))
                 
            }
            
        }
    }
}

#Preview {
    CodeViewTWO(codee: CodeeTwo.sampleCode)
}
