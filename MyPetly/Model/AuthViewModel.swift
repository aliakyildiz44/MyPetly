//
//  AuthViewModel.swift
//  MyPetly
//
//  Created by Ali on 23.12.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("giriş yapıldı")
    }
    func createUser(withEmail email: String, password: String, name: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, name: name, email: email)
            let encodeUser = try Firestore.Encoder().encode(user) 
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
        } catch {
            print("Hesap oluşturulamadı \(error.localizedDescription)")
        }
    }
    func signOut() {
        
    }
    func deleteAccount() {
        
    }
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
    guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("Debug: Şimdiki kullanıcı:\(self.currentUser)")
    }
}
