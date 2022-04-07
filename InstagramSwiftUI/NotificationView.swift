//
//  NotificationView.swift
//  MyAppSwiftUI
//
//  Created by Farmani Nasir on 31/03/22.
//

import SwiftUI

struct NotificationView: View {
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<20) { _ in
                    NotificationCellView()
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationCellView: View {
    @State private var showPostImage = false

    var body: some View {
        HStack {
            Image("venom")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
                Text("Venom ")
                    .font(.system(size: 14, weight: .semibold)) + Text("Liked one of your post")
                    .font(.system(size: 14))
            
            Spacer()
            
            if showPostImage {
                Image("venom")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } else {
                Button {
                    
                } label: {
                    Text("Follow")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }

            }
        }
        .padding(.horizontal)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
