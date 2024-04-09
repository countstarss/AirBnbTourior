//
//  ProfileView.swift
//  AirBnbTourior
//
//  Created by 王佩豪 on 2024/4/7.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment:.leading,spacing:24){
            // Profile
            VStack(alignment:.leading,spacing:8) {
                Text("Profile")
                    .font(.largeTitle)
                .fontWeight(.semibold)
                Text("log in to start planning tour next trip!")
            }

            // 复用login button
            // Login Button
            LoginButtonView(title: "Log in")
            
            //
            HStack{
                Text("Don't have a account?")
                
                Text("Sign up")
                    .fontWeight(.semibold)
                    .underline()
            }
            .font(.caption)
            
            VStack(spacing:24){
                ProfileOptionView(imageName: "gear", title: "Setting")
                ProfileOptionView(imageName: "gear", title: "Accessibility")
                ProfileOptionView(imageName: "questionmark.circle", title: "Visit the help Center")
            }
        }
        .padding()
        
        
    }
}

#Preview {
    ProfileView()
}

struct LoginButtonView: View {
    let title:String
    var body: some View {
        Button{
            // Here are the functions used by buttons
            
        }label: {
            Text(title)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width:360,height:48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
