//
//  SearchView.swift
//  MyAppSwiftUI
//
//  Created by Farmani Nasir on 31/03/22.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var isSearchMode: Bool = false
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBarView(text: $searchText, isEditing: $isSearchMode)
                .padding()
            
            ZStack {
                if isSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchBarView: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    })
                .onTapGesture {
                    isEditing = true
                }
            
            if isEditing {
                Button {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
            }
            
            
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
