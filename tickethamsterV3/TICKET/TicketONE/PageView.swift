//
//  PageView.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct PageView: View {
    
    // Datos del ticket (vienen del modelo Page, que a su vez se llenó desde la base)
    var page: Page
    
    // VAR DEL MODAL
    @State private var modal = false
    @State private var modal2 = false
    
    // ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // MARK: - IMAGEN DE FONDO DEL TICKET
            ticketBackground
            
            // MARK: - Type (tx1)
            Text(page.tx1)
                .font(.system(size: 15))
                .padding(.bottom, 580)
                .foregroundColor(.white)
            
            // MARK: - HEADER (tx2: "SEC ROW SEAT" o "General Admission")
            Text(page.tx2)
                .font(.system(size: 14))
                .padding(.bottom, 500)
                .foregroundColor(.white)
            
            // MARK: - Sec (tx3)
            Text(page.tx3).bold()
                .font(.system(size: 22))
                .padding(.bottom, 415)
                .padding(.trailing, 240)
                .foregroundColor(.white)
            
            // MARK: - Row (tx4)
            Text(page.tx4).bold()
                .font(.system(size: 22))
                .padding(.bottom, 415)
                .foregroundColor(.white)
            
            // MARK: - Seat (tx5)
            Text(page.tx5).bold()
                .font(.system(size: 22))
                .padding(.bottom, 415)
                .padding(.leading, 240)
                .foregroundColor(.white)
            
            // MARK: - EVENT NAME (tx6)
            Text(page.tx6)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            // MARK: - EVENT DATE (tx7)
            Text(page.tx7)
                .font(.system(size: 12))
                .padding(.top, 60)
                .foregroundColor(.white)
            
            // MARK: - tx8 ("Mobile Entry")
            Text(page.tx8)
                .foregroundColor(.black)
                .font(.system(size: 15))
                .padding(.top, 200)
            
            // MARK: - BOTÓN VER CÓDIGO
            Button(action: { modal.toggle() }) {
                ZStack {
                    Rectangle()
                        .frame(width: 325, height: 50)
                        .foregroundColor(Color("nHead"))
                        .cornerRadius(1.0)
                    
                    HStack {
                        Image("scan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .padding(.trailing, 10)
                        Text("View Ticket")
                            .font(.system(size: 15))
                    }
                    .foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $modal) {
                CodeViewer()
            }
            .padding(.top, 350)
            
            // MARK: - BOTÓN DETALLES
            HStack {
                Button(action: { modal2.toggle() }) {
                    Text("Ticket Details")
                        .fontWeight(.medium)
                        .foregroundColor(Color("blueticket"))
                        .font(.custom("Lexend", size: 14))
                        .padding(13)
                        .cornerRadius(4)
                }
                .fullScreenCover(isPresented: $modal2) {
                    Details()
                }
            }
            .padding(.top, 510)
        }
    }
    
    // MARK: - Subvista: fondo del ticket (usa URL de la base o imagen local)
    private var ticketBackground: some View {
        Group {
            if let url = URL(string: page.imageUrl), !page.imageUrl.isEmpty {
                // Si imageUrl es una URL válida (Firebase Storage, etc.)
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 380, height: 651)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 380, height: 651)
                    case .failure:
                        // Fallback si la URL falla
                        Image("ticket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 380, height: 651)
                    @unknown default:
                        Image("ticket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 380, height: 651)
                    }
                }
            } else {
                // Si no hay URL, usamos imagen local
                Image("ticket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 651)
            }
        }
    }
}

#Preview {
    PageView(page: Page.samplePage)
}
