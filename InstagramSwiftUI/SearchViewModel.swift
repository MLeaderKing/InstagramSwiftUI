//
//  SearchViewModel.swift
//  InstagramSwiftUI
//
//  Created by Nasir Farmani on 09/04/22.
//

import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USER.collection("users").getDocuments { [unowned self] snapshot, error in
            guard let documents = snapshot?.documents else { return }
            
            users = documents.compactMap({ try? $0.data(as: User.self)})
            
        }
    }
    
    func filterUsrs(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery)})
    }
}
