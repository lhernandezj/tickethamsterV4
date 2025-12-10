//
//  TicketsViewModel.swift
//  tickethamsterV3
//

import Foundation
import FirebaseFirestore

class TicketsViewModel: ObservableObject {
    @Published var pages: [Page] = []
    @Published var isLoading: Bool = true
    
    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    init() {
        listenToTickets()
    }
    
    func listenToTickets() {
        print("🔥 listenToTickets() llamado")
        
        listener = db.collection("Event")
            .document("Ticket")   // Colección: Event, Documento: Ticket
            .addSnapshotListener { [weak self] snapshot, error in
                
                guard let self = self else { return }
                
                print("📡 snapshotListener disparado")
                self.isLoading = false
                
                if let error = error {
                    print("❌ Error escuchando Event/Ticket: \(error)")
                    return
                }
                
                guard let data = snapshot?.data() else {
                    print("⚠️ El documento Event/Ticket no existe o no tiene data")
                    self.pages = []
                    return
                }
                
                print("📄 Data del doc Ticket: \(data)")
                
                let type      = data["Type"]      as? String ?? ""
                let sec       = data["Sec"]       as? String ?? ""
                let row       = data["Row"]       as? String ?? ""
                let seat      = data["Seat"]      as? String ?? ""
                let name      = data["Name"]      as? String ?? ""
                let date      = data["Date"]      as? String ?? ""
                let imageUrl  = data["imageUrl"]  as? String ?? ""   // 👈 AHORA ESTE ES EL CAMPO
                let barcode   = data["Barcode"]   as? String ?? ""
                let safeIMG   = data["SafeIMG"]   as? String ?? ""
                let acceso    = data["Acceso"]    as? String ?? ""
                
                let page = Page(
                    type: type,
                    sec: sec,
                    row: row,
                    seat: seat,
                    name: name,
                    date: date,
                    imageUrl: imageUrl,
                    barcodeUrl: barcode,
                    safeUrl: safeIMG,
                    acceso: acceso,
                    tag: 0,
                    headerText: "SEC     ROW     SEAT"
                )
                
                DispatchQueue.main.async {
                    self.pages = [page]
                    print("✅ pages actualizado, count = \(self.pages.count)")
                }
            }
    }
    
    deinit {
        listener?.remove()
    }
}
