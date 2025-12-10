//
//  EventsView.swift
//  Ticketmaster4
//
//  Created by Eduardo Jimenez on 10/12/25.
//

// EventViewModel.swift

import Foundation
import FirebaseFirestore

class EventViewModel: ObservableObject {
    @Published var event: EventModel?

    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?

    init() {
        listenToEvent()
    }

    func listenToEvent() {
        listener = db.collection("Event")
            .document("Evento")
            .addSnapshotListener { [weak self] snapshot, error in
                
                if let error = error {
                    print("Error escuchando Event/Evento: \(error)")
                    return
                }

                guard let data = snapshot?.data() else {
                    print("Documento vacío o no existe")
                    return
                }

                let nombre   = data["Nombre"]   as? String ?? ""
                let lugar    = data["Lugar"]    as? String ?? ""
                let fecha    = data["Fecha"]    as? String ?? ""
                let eventIMG = data["eventIMG"] as? String ?? ""   // 👈 lee el campo

                DispatchQueue.main.async {
                    self?.event = EventModel(
                        nombre: nombre,
                        lugar: lugar,
                        fecha: fecha,
                        eventIMG: eventIMG
                    )
                }
            }
    }

    deinit {
        listener?.remove()
    }
}
