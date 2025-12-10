//
//  Error.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 18/10/24.
//

import SwiftUI

struct Error: View {
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack{
            ZStack{
                
                Color.white

                ZStack(){
                    
                    ZStack{
                        
                        Text("Sorry, we could't find the section you're looking for.")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 70)
                            .font(.system(size: 18))
                        
                        
                        Text(.init("Please try again later or check your internet connection."))
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
                    
                    
                    Text("Error")
                        .fontWeight(.medium)
                        .bold()
                        .font(.custom("Lexend", size: 18))
                        .foregroundColor(Color.white)
                        .padding(.top, 10)
                    
                    
                }
                .frame(maxHeight: .infinity,alignment: .top)
            }
        }
        .frame(maxHeight: .infinity,alignment: .top)
        //ENDS HEAD
    }
}

#Preview {
    Error()
}
