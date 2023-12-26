//
//  DataManager.swift
//  MyPetly
//
//  Created by Ali on 23.12.2023.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var dogs: [Pet] = []
    
    init() {
        fetchDogs()
    }
    
    
    func fetchDogs() {
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    
                    let dog = Pet(id: id, name: name)
                    self.dogs.append(dog)
                    
                }
            }
            
        }
    }
}
