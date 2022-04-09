//
//  ProfileView.swift
//  MyAppSwiftUI
//
//  Created by Farmani Nasir on 31/03/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                
                PostGridView()
            }
        }
    }
}

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                
                UserStatView(value: 1, title: "Posts")
                UserStatView(value: 2, title: "Followers")
                UserStatView(value: 3, title: "Following")
                
                Spacer()
            }
            
            Text(user.fullname)
                .font(.system(size: 15, weight: .semibold))

            Text("Gotham's Dark Knoght || Billionaire")
                .font(.system(size: 15))

            ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
        }
        .padding()
    }
}

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 15))
        }
       
    }
}

struct ProfileActionButtonView: View {
    let isCurrentUser: Bool
    var isFollowed = false
    
    var body: some View {
        if isCurrentUser {
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: 1)
                    Text("Edit Profile")
                        .font(.system(size: 15, weight: .semibold))
                        
                        .foregroundColor(.black)
                }
                .frame(height: 32)
            }
        } else {
            HStack {
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        Text(isFollowed ? "Following" : "Follow")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(isFollowed ? .black : .white)
                    }
                    .frame(height: 32)
                    .background(isFollowed ? .white : .blue)
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                        Text("Message")
                            .font(.system(size: 15, weight: .semibold))
                            
                            .foregroundColor(.black)
                    }
                    .frame(height: 32)
                }
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
