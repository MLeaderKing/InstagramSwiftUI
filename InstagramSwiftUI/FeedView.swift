//
//  FeedView.swift
//  MyAppSwiftUI
//
//  Created by Farmani Nasir on 31/03/22.
//

import SwiftUI

struct FeedView: View {

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<20) { _ in
                    FeedCellView()
                }
            }
        }
    }
}

struct FeedCellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("venom")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text("Venom")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom, .top], 8)
            
            Image("venom")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                }

                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                }
            }
            .foregroundColor(.black)
            .padding(.leading, 8)

            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)

            HStack {
                Text("Venom ")
                    .font(.system(size: 14, weight: .semibold)) + Text("All men have limits. They learn what they are learn not to exceed them. I ignore mine")
            }
            .padding(.horizontal, 8)
            .font(.system(size: 14))

            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)

        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
