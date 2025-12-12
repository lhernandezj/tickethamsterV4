//
//  CodeViewer.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct CodeViewer: View {

    @Environment(\.presentationMode) var presentationMode

    // ✅ LIVE pages (se actualiza si el listener cambia)
    @Binding var pages: [Page]

    @State private var codeIndex: Int

    init(pages: Binding<[Page]>, initialIndex: Int = 0) {
        self._pages = pages
        _codeIndex = State(initialValue: initialIndex)
    }

    var body: some View {

        ZStack {

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

                        // Bottom indicator
                        if pages.count <= 1 {
                            Text("1 de 1")
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                        } else {
                            HStack(spacing: 10) {

                                Button(action: goPrevious) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }
                                .buttonStyle(.plain)

                                Text("\(safeDisplayIndex) de \(pages.count)")
                                    .foregroundColor(.white)

                                Button(action: goNext) {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.bottom, 8)
                        }
                    }
                    .tag(index) // ✅ tag = index
                }
            }
            .animation(.easeInOut, value: codeIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
        }

        // HEAD
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
            print("✅ CodeViewer pages.count =", pages.count)
        }
        .onChange(of: pages.count) { _ in
            // ✅ si cambia el número de tickets, mantenemos el índice válido
            clampIndex()
            print("✅ CodeViewer updated pages.count =", pages.count)
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

    private func clampIndex() {
        if pages.isEmpty {
            codeIndex = 0
        } else {
            codeIndex = min(max(codeIndex, 0), pages.count - 1)
        }
    }

    private func goNext() {
        guard pages.count > 1 else { return }
        if codeIndex < pages.count - 1 {
            codeIndex += 1
        } else {
            codeIndex = 0
        }
    }

    private func goPrevious() {
        guard pages.count > 1 else { return }
        if codeIndex > 0 {
            codeIndex -= 1
        } else {
            codeIndex = pages.count - 1
        }
    }
}

#Preview {
    // Preview con state local
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
