//
//  TicketsViewTWO.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/02/25.
//

import SwiftUI

struct TicketsViewTWO: View {
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    @State var modal3 = false
    
    @State private var pageIndex = 0
    private let pages: [PageTwo] = PageTwo.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        
        ZStack{
            ZStack{
                TabView(selection: $pageIndex) {
                    ForEach(pages) { page in
                        
                        VStack{
                            Spacer()
                            PageViewTWO(page: page)
                                .padding(.bottom, 30)
                            
                        }
                        .tag(page.tag)
                    }
                }
                .animation(.easeInOut, value: pageIndex)
                .tabViewStyle(.page)
                
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .onAppear(){
                    dotAppearance.currentPageIndicatorTintColor = .gray
                    dotAppearance.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.2)
                }
            }
            .padding(.bottom, 120)
            
            Button("Transfer"){
               
                modal3.toggle()
                }
                .fullScreenCover(isPresented: $modal3){
                    Error()
                    }
                    .font(.custom("Lexend", size: 16).bold())
                    .foregroundColor(Color.white)
            
                    .padding(25)
                    .frame(height: 45)
                    .frame(width: 365)
                    .background(Color("nHead"))
                    .cornerRadius(2)
                    .hoverEffect()
                    .padding(.top, 720)
                
        }
        //STARTS HEAD
        .overlay {
            
            
            ZStack{
                
                //ESTE BOTON CIERRA EL MODAL
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    
                    
                    
                    Color("nHead")
                        .frame(width: 500, height: 105)
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
                    
                    
                    Text("My Tickets")
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
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero () {
        pageIndex = 0
    }
    
}


#Preview {
    TicketsViewTWO()
}
