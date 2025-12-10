//
//  CodeViewer.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct CodeViewer: View {
    
    @State private var animation: Bool = false
    @State private var animation2: Bool = false
    @State private var code: Bool = false
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    // 🔥 Ahora trabajamos con PAGES (tickets)
    let pages: [Page]
    
    @State private var codeIndex: Int
    
    // Init para poder inicializar codeIndex
    init(pages: [Page], initialIndex: Int = 0) {
        self.pages = pages
        _codeIndex = State(initialValue: initialIndex)
    }
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .frame(width:440,height: 100)
                .padding(.top, 840)
                .foregroundColor(Color("nHead"))
            
            ZStack{
                TabView(selection: $codeIndex) {
                    ForEach(pages) { page in
                        
                        VStack{
                            Spacer()
                            
                            // 👈 AQUÍ EL CAMBIO
                            CodeView(page: page)
                                .padding(.bottom, 30)
                            
                            if page.tag == (pages.last?.tag ?? 0) {
                                Button(action: goToZero){
                                    HStack{
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))

                                        Text("\(pages.count) of \(pages.count)")
                                            .foregroundColor(.white)
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                            .opacity(0.5)
                                    }
                                    .padding(.bottom, 8)
                                }
                            } else {
                                Button(action: incrementPage){
                                    HStack{
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                            .opacity(0.5)
                                        
                                        Text("\(codeIndex + 1) of \(pages.count)")
                                            .foregroundColor(.white)
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                    }
                                    .padding(.bottom, 8)
                                }
                            }
                            
                        }
                        .tag(page.tag)
                    }
                }
                .animation(.easeInOut, value: codeIndex)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onAppear(){
                    animation.toggle()
                }
            }
        }
        
        //STARTS HEAD
        .overlay {
            ZStack{
                
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    
                    Color("nHead")
                        .frame(width: 600, height: 112)
                        .background(.ultraThinMaterial)
                        .blur(radius: 0.5)
                        .edgesIgnoringSafeArea(.top)
                }
                .frame(maxHeight: .infinity,alignment: .top)
                
                ZStack(alignment: .leading){
                    
                    Image(systemName: "multiply")
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .padding(.trailing, 350)
                        .padding(.top, 16)
                    
                    if let currentPage = currentPage {
                        Text(currentPage.tx6)
                            .fontWeight(.medium)
                            .bold()
                            .font(.custom("Lexend", size: 15))
                            .foregroundColor(Color.white)
                            .padding(.leading, 35)
                        
                        Text(currentPage.tx7)
                            .fontWeight(.medium)
                            .bold()
                            .font(.custom("Lexend", size: 12))
                            .foregroundColor(Color.white)
                            .padding(.top, 32)
                            .padding(.leading, 35)
                    }
                }
                .padding(.bottom, 825)
            }
        }
        .frame(maxHeight: .infinity,alignment: .top)
        //ENDS HEAD
    }
    
    // Página actual segura
    private var currentPage: Page? {
        guard !pages.isEmpty else { return nil }
        let safeIndex = min(max(codeIndex, 0), pages.count - 1)
        return pages[safeIndex]
    }
    
    func incrementPage() {
        if codeIndex < pages.count - 1 {
            codeIndex += 1
        }
    }
    
    func goToZero () {
        codeIndex = 0
    }
}

#Preview {
    CodeViewer(pages: Page.samplePages)
}
