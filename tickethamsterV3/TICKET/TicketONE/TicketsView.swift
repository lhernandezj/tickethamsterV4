//
//  TicketsView.swift
//  tickethamsterV3
//

import SwiftUI

struct TicketsView: View {

    @Environment(\.presentationMode) var presentationMode

    @State private var modal3 = false
    @State private var pageIndex = 0

    // ✅ AHORA ES OPTIONAL (clave)
    @State private var selectedIndex: Int? = nil

    private let dotAppearance = UIPageControl.appearance()

    @StateObject private var ticketsVM = TicketsViewModel()

    var body: some View {
        ZStack {
            contentView
                .padding(.bottom, 120)

            transferButton
        }
        // ✅ fullScreenCover(item:)
        .fullScreenCover(item: $selectedIndex) { index in
            CodeViewer(
                pages: $ticketsVM.pages,
                initialIndex: index
            )
        }
        .overlay { headerView }
        .frame(maxHeight: .infinity, alignment: .top)
    }

    // MARK: - Main content

    @ViewBuilder
    private var contentView: some View {
        ZStack {
            if ticketsVM.isLoading {
                VStack {
                    Spacer()
                    ProgressView("Cargando tickets…")
                        .padding(.bottom, 60)
                }
            } else if ticketsVM.pages.isEmpty {
                VStack {
                    Spacer()
                    Text("No hay tickets para este evento")
                        .foregroundColor(.gray)
                        .padding(.bottom, 60)
                }
            } else {
                ticketsPager
            }
        }
    }

    private var ticketsPager: some View {
        TabView(selection: $pageIndex) {
            ForEach(Array(ticketsVM.pages.enumerated()), id: \.element.id) { index, page in
                VStack {
                    Spacer()
                    PageView(
                        page: page,
                        onOpenCode: {
                            // ✅ SOLO ESTO
                            selectedIndex = index
                        }
                    )
                    .padding(.bottom, 30)
                }
                .tag(index)
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .gray
            dotAppearance.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.2)
        }
    }

    // MARK: - Transfer button

    private var transferButton: some View {
        Button("Transfer") { modal3.toggle() }
            .fullScreenCover(isPresented: $modal3) { Error() }
            .font(.custom("Lexend", size: 16).bold())
            .foregroundColor(.white)
            .padding(25)
            .frame(height: 45)
            .frame(width: 365)
            .background(Color("nHead"))
            .cornerRadius(2)
            .hoverEffect()
            .padding(.top, 720)
    }

    // MARK: - Header

    private var headerView: some View {
        ZStack {
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Color("nHead")
                    .frame(width: 500, height: 105)
                    .background(.ultraThinMaterial)
                    .blur(radius: 0.5)
                    .edgesIgnoringSafeArea(.top)
            }
            .frame(maxHeight: .infinity, alignment: .top)

            ZStack {
                Image(systemName: "multiply")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .padding(.trailing, 350)

                Text("My Tickets")
                    .fontWeight(.medium)
                    .bold()
                    .font(.custom("Lexend", size: 18))
                    .foregroundColor(.white)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

// ✅ NECESARIO para fullScreenCover(item:)
extension Int: Identifiable {
    public var id: Int { self }
}

#Preview {
    TicketsView()
}
