//
//  CodeViewer.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct CodeViewer: View {

    @Environment(\.presentationMode) var presentationMode

    @Binding var pages: [Page]

    // ✅ Guardamos el índice inicial “real”
    private let initialIndex: Int

    // ✅ Índice actual del TabView
    @State private var codeIndex: Int = 0

    init(pages: Binding<[Page]>, initialIndex: Int = 0) {
        self._pages = pages
        self.initialIndex = initialIndex
        _codeIndex = State(initialValue: initialIndex)
    }

    var body: some View {

        ZStack {

            // ✅ FOOTER (como antes: NO empuja el layout)
            Rectangle()
                .frame(width: 440, height: 100)
                .padding(.top, 840)
                .foregroundColor(Color("nHead"))

            TabView(selection: $codeIndex) {
                ForEach(Array(pages.enumerated()), id: \.element.id) { index, page in
                    VStack {
                        Spacer()

                        CodeView(page: page)
                            .padding(.bottom, 30)

                        if pages.count <= 1 {
                            Text("1 de 1")
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                        } else {
                            Text("\(safeDisplayIndex) de \(pages.count)")
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                        }
                    }
                    .tag(index)
                }
            }
            // ✅ Esto ayuda cuando SwiftUI reusa la vista: “resetea” el TabView si cambia el índice inicial
            .id(initialIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: codeIndex)
            .gesture(DragGesture()) // 🔒 bloquea swipe
        }

        // 🔺 HEAD
        .overlay {
            ZStack {

                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Color("nHead")
                        .frame(width: 600, height: 112)
                        .background(.ultraThinMaterial)
                        .blur(radius: 0.5)
                        .edgesIgnoringSafeArea(.top)
                }
                .frame(maxHeight: .infinity, alignment: .top)

                ZStack(alignment: .leading) {

                    Image(systemName: "multiply")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .padding(.trailing, 350)
                        .padding(.top, 16)

                    if let currentPage = currentPage {
                        Text(currentPage.tx6)
                            .fontWeight(.medium)
                            .bold()
                            .font(.custom("Lexend", size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 35)

                        Text(currentPage.tx7)
                            .fontWeight(.medium)
                            .bold()
                            .font(.custom("Lexend", size: 12))
                            .foregroundColor(.white)
                            .padding(.top, 32)
                            .padding(.leading, 35)
                    }
                }
                .padding(.bottom, 825)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear {
            syncToInitialIndex()
            print("✅ CodeViewer pages.count =", pages.count, "initialIndex =", initialIndex, "codeIndex =", codeIndex)
        }
        .onChange(of: pages.count) { _ in
            // cuando llegan datos del listener, re-sincroniza el index
            syncToInitialIndex()
        }
    }

    // MARK: - Helpers

    private var safeDisplayIndex: Int {
        guard pages.count > 0 else { return 0 }
        return min(max(codeIndex + 1, 1), pages.count)
    }

    private var currentPage: Page? {
        guard !pages.isEmpty else { return nil }
        let safeIndex = min(max(codeIndex, 0), pages.count - 1)
        return pages[safeIndex]
    }

    private func syncToInitialIndex() {
        guard !pages.isEmpty else {
            codeIndex = 0
            return
        }
        let clamped = min(max(initialIndex, 0), pages.count - 1)
        codeIndex = clamped
    }
}


#Preview {
    StatefulPreviewWrapper(Page.samplePages) { pages in
        CodeViewer(pages: pages, initialIndex: 0)
    }
}

// Helper solo para preview
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    let content: (Binding<Value>) -> Content
    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: value)
        self.content = content
    }
    var body: some View { content($value) }
}
