//
//  PageViewTWO.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/02/25.
//

import SwiftUI

struct PageViewTWO: View {
    
    @State var isPresented: Bool = false
    
    //VAR DEL MODAL
    @State var modal = false
    
    @State var modal2 = false
    
    @State var modal3 = false
    
    @State var modal4 = false
    
    @State var modal5 = false
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    var page : PageTwo
    
    var body: some View {
        ZStack(){
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .frame(width: 380, height: 651)
            
            Text(page.tx1)
                .font(.system(size: 15))
                .padding(.bottom, 580)
                .foregroundColor(Color.white)
            
            Text(page.tx2)
                .font(.system(size: 20))
                .padding(.bottom, 500)
                .foregroundColor(Color.white)
            
            Text(page.tx3).bold()
                .font(.system(size: 22))
                .padding(.bottom, 415)
                .padding(.trailing, 240)
                .foregroundColor(Color.white)
            
            Text(page.tx4).bold()
                .font(.system(size: 22))
                .padding(.bottom, 415)
                .foregroundColor(Color.white)
            
            Text(page.tx5).bold()
                .font(.system(size: 22))
                .padding(.bottom, 415)
                .padding(.leading, 240)
                .foregroundColor(Color.white)
            
            //EVENT NAME
            Text(page.tx6)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .padding(.bottom, 20)
            
            //EVENT DATE
            Text(page.tx7)
                .font(.system(size: 12))
                .padding(.top, 60)
                .foregroundColor(Color.white)
            
            Text(page.tx8)
                .foregroundColor(Color.black)
                .font(.system(size: 15))
                .padding(.top, 200)
            
            //BUTTON TO CODE
            Button(action: { modal.toggle() }) {
                ZStack{
                    Rectangle()
                        .frame(width: 325, height: 50)
                        .foregroundColor(Color("nHead"))
                        .cornerRadius(1.0)
                    
                    HStack{
                        Image("scan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .padding(.trailing, 10)
                        Text("View Ticket")
                            .font(.system(size: 15))
                    }
                    .foregroundColor(Color.white)
                }
            }
            .fullScreenCover(isPresented: $modal){
                CodeViewerTWO()
            }
            .padding(.top, 350)

            HStack{
                //BUTTON TO DETAILS
                Button(action: {modal2.toggle()}) {
                    Text("Ticket Details")
                        .fontWeight(.medium)
                        .foregroundColor(Color("blueticket"))
                        .font(.custom("Lexend", size: 14))
                        .padding(13)
                        .cornerRadius(4)
                }
                .fullScreenCover(isPresented: $modal2){
                    DetailsTWO()
                }
                
            }
            .padding(.top, 510)
            
        }
    }
}


#Preview {
    PageViewTWO(page: PageTwo.samplePageTwo)
}
